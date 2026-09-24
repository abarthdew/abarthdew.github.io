require 'net/http'
require 'uri'
require 'addressable/uri'
require 'nokogiri'

# Mirrors a post's body from an external GitHub repo's raw markdown at build time.
# Front matter fields:
#   external_repo:   "owner/repo"        (required)
#   external_path:   "path/to/file.md"   (required)
#   external_branch: "main"              (optional, defaults to "main")
#
# If the fetch fails (repo/branch/path missing, network error, etc.), only this
# post falls back to a warning message -- the rest of the site still builds.
module ExternalMirror
  def self.source_url(repo, branch, path, kind = 'raw')
    base = kind == 'raw' ? "https://raw.githubusercontent.com/#{repo}/" : "https://github.com/#{repo}/blob/"
    ref = Addressable::URI.encode_component(branch, Addressable::URI::CharacterClasses::UNRESERVED)
    Addressable::URI.parse("#{base}#{ref}/#{path}").normalize.to_s
  end

  # Work on rendered HTML so fenced code, reference-style links, and nested
  # Markdown image labels are handled by Jekyll's parser, not regular expressions.
  module Filters
    def external_mirror_links(html, page)
      repo = page['external_repo']
      path = page['external_path']
      return html unless repo && path

      branch = page['external_branch'] || 'main'
      fragment = Nokogiri::HTML.fragment(html)
      fragment.css('img[src], a[href]').each do |node|
        image = node.name == 'img'
        attribute = image ? 'src' : 'href'
        url = node[attribute]
        next if url.nil? || url.empty? || url.start_with?('#', '//')

        if image && url.match?(%r{\Ahttps://github\.com/[^/]+/[^/]+/blob/})
          node[attribute] = url.sub('https://github.com/', 'https://raw.githubusercontent.com/').sub('/blob/', '/')
        elsif Addressable::URI.parse(url).relative?
          kind = image ? 'raw' : 'blob'
          base_path = url.start_with?('/') ? '' : path
          base = ExternalMirror.source_url(repo, branch, base_path, kind)
          node[attribute] = Addressable::URI.join(base, url.sub(%r{\A/}, '')).normalize.to_s
        end
      end
      fragment.to_html
    end
  end

  class Generator < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      site.posts.docs.each do |post|
        repo = post.data['external_repo']
        path = post.data['external_path']
        next unless repo && path

        branch = post.data['external_branch'] || 'main'

        begin
          uri = URI(ExternalMirror.source_url(repo, branch, path))
          res = fetch_with_redirects(uri)

          if res.is_a?(Net::HTTPSuccess)
            # raw.githubusercontent.com bytes are UTF-8, but Net::HTTP tags the
            # body as ASCII-8BIT by default, which breaks Liquid rendering on
            # any non-ASCII (e.g. Korean) content.
            body = res.body.dup.force_encoding('UTF-8')
            raise "invalid UTF-8 byte sequence" unless body.valid_encoding?
            # Defensive compatibility for older source documents. Blog metadata
            # remains in the local wrapper, never imported from a source README.
            post.content = body.sub(/\A---\r?\n.*?\r?\n---\r?\n/m, '')
            post.data['render_with_liquid'] = false
          else
            post.content = fallback_message(repo, path, "HTTP #{res.code}")
          end
        rescue => e
          post.content = fallback_message(repo, path, e.message)
        end

        # Jekyll creates excerpts while reading the empty metadata wrappers.
        if post.data['excerpt'].is_a?(Jekyll::Excerpt)
          post.data['excerpt'] = Jekyll::Excerpt.new(post)
        end
      end
    end

    private

    def fetch_with_redirects(uri, limit = 5)
      raise 'too many redirects' if limit == 0

      res = Net::HTTP.start(uri.host, uri.port, use_ssl: true, open_timeout: 10, read_timeout: 10) do |http|
        http.get(uri)
      end

      case res
      when Net::HTTPRedirection
        redirected = URI.join(uri.to_s, res['location'])
        raise 'redirect must use HTTPS' unless redirected.scheme == 'https'
        fetch_with_redirects(redirected, limit - 1)
      else
        res
      end
    end

    def fallback_message(repo, path, reason)
      Jekyll.logger.warn 'External mirror:', "#{repo}/#{path}: #{reason}"
      "> ⚠️ 원본 문서를 불러올 수 없습니다 (`#{repo}/#{path}`, #{reason}). " \
      "원본 저장소가 삭제되었거나 경로/브랜치가 바뀌었을 수 있습니다.\n"
    end
  end
end

Liquid::Template.register_filter(ExternalMirror::Filters)
