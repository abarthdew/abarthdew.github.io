require 'net/http'
require 'uri'

# Mirrors a post's body from an external GitHub repo's raw markdown at build time.
# Front matter fields:
#   external_repo:   "owner/repo"        (required)
#   external_path:   "path/to/file.md"   (required)
#   external_branch: "main"              (optional, defaults to "main")
#
# If the fetch fails (repo/branch/path missing, network error, etc.), only this
# post falls back to a warning message -- the rest of the site still builds.
module ExternalMirror
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
          uri = URI("https://raw.githubusercontent.com/#{repo}/#{branch}/#{path}")
          res = fetch_with_redirects(uri)

          if res.is_a?(Net::HTTPSuccess)
            post.content = fix_github_image_links(res.body, repo, branch)
          else
            post.content = fallback_message(repo, path, "HTTP #{res.code}")
          end
        rescue => e
          post.content = fallback_message(repo, path, e.message)
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
        fetch_with_redirects(URI(res['location']), limit - 1)
      else
        res
      end
    end

    # The source repo sometimes links images as .../blob/<branch>/... (an HTML
    # viewer page, not the raw bytes), which does not render inline. Rewrite
    # those to .../raw/<branch>/... for both Markdown and <img> syntax.
    def fix_github_image_links(body, repo, branch)
      body.gsub(%r{(github\.com/#{Regexp.escape(repo)})/blob/}i, '\1/raw/')
    end

    def fallback_message(repo, path, reason)
      "> ⚠️ 원본 문서를 불러올 수 없습니다 (`#{repo}/#{path}`, #{reason}). " \
      "원본 저장소가 삭제되었거나 경로/브랜치가 바뀌었을 수 있습니다.\n"
    end
  end
end
