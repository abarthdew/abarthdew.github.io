require 'jekyll'
require 'nokogiri'
require_relative '../_plugins/external_mirror'

# Usage: bundle exec ruby tools/verify_mirror_build.rb /path/to/source-checkouts
# Checkout folders must be named after the source repositories. This test-only
# fetch adapter validates pending source PRs without changing production refs.
source_root = File.expand_path(ARGV.fetch(0))
blog_root = File.expand_path('..', __dir__)
fetched = []
ExternalMirror::Generator.define_method(:fetch_with_redirects) do |uri, _limit = 5|
  repo, _branch, *parts = uri.path.split('/').drop(2)
  file = File.join(source_root, repo, *parts)
  raise "Missing local source: #{file}" unless File.file?(file)
  body = File.binread(file)
  fetched << file
  response = Net::HTTPOK.new('1.1', '200', 'OK')
  response.define_singleton_method(:body) { body }
  response
end

Dir.chdir(blog_root) do
  site = Jekyll::Site.new(Jekyll.configuration('source' => blog_root,
    'destination' => File.join(blog_root, '_site'), 'future' => true))
  site.process
  raise "Expected 41 sources, got #{fetched.length}" unless fetched.length == 41
  site.posts.docs.each do |post|
    output = Nokogiri::HTML(post.output)
    content = output.at_css('.post-content')
    raise "Empty output: #{post.path}" if !content || content.text.strip.empty?
    raise "Empty excerpt: #{post.path}" if post.data['excerpt'].to_s.strip.empty?
    content.css('img[data-src], img[src]').each do |img|
      src = img['data-src'] || img['src']
      raise "Relative image: #{post.path}: #{src}" unless src =~ /\A(?:https?:|data:|\/\/)/
    end
  end
  vue = site.posts.docs.find { |p| p.basename.include?('composition_api') }
  raise 'Vue template lost' unless Nokogiri::HTML(vue.output).text.include?('{{ title }}')
  db = site.posts.docs.find { |p| p.basename.include?('postgresql2') }
  raise 'Database tables missing' if Nokogiri::HTML(db.output).css('.post-content table').empty?
  puts 'PASS: 41 posts, image URLs, excerpts, Vue examples, PostgreSQL tables.'
end
