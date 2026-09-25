require 'minitest/autorun'
require 'jekyll'
require_relative '../_plugins/external_mirror'

class ExternalMirrorTest < Minitest::Test
  include ExternalMirror::Filters

  PAGE = { 'external_repo' => 'owner/repo', 'external_branch' => 'main', 'external_path' => 'docs/topic/note.md' }.freeze

  def render(markdown, page = PAGE)
    html = Kramdown::Document.new(markdown, input: 'GFM').to_html
    Nokogiri::HTML.fragment(external_mirror_links(html, page))
  end

  def test_relative_images_and_document_links
    doc = render("![image](./images/a.png)\n\n[related](../other.md#section)\n\n[root](/README.md)")
    assert_equal 'https://raw.githubusercontent.com/owner/repo/main/docs/topic/images/a.png', doc.at_css('img')['src']
    assert_equal 'https://github.com/owner/repo/blob/main/docs/other.md#section', doc.css('a')[0]['href']
    assert_equal 'https://github.com/owner/repo/blob/main/README.md', doc.css('a')[1]['href']
  end

  def test_reference_images_html_and_encoded_filenames
    doc = render("![label][pic]\n\n[pic]: ./images/a(1).png\n\n<img src=\"./images/a b.png\">\n")
    assert_equal 'https://raw.githubusercontent.com/owner/repo/main/docs/topic/images/a(1).png', doc.css('img')[0]['src']
    assert_equal 'https://raw.githubusercontent.com/owner/repo/main/docs/topic/images/a%20b.png', doc.css('img')[1]['src']
  end

  def test_only_blob_images_are_rewritten
    url = 'https://github.com/another/repo/blob/main/image.png'
    doc = render("![image](#{url})\n\n[link](#{url})\n\n[section](#section)\n\n[email](mailto:hello@example.com)")
    assert_equal 'https://raw.githubusercontent.com/another/repo/main/image.png', doc.at_css('img')['src']
    assert_equal [url, '#section', 'mailto:hello@example.com'], doc.css('a').map { |a| a['href'] }
  end

  def test_code_examples_and_non_mirror_posts_are_untouched
    markdown = "```vue\n<img src=\"./example.png\">{{ title }}\n```\n\n`![image](./code.png)`"
    doc = render(markdown)
    assert_includes doc.text, '<img src="./example.png">{{ title }}'
    assert_includes doc.text, '![image](./code.png)'
    assert_empty doc.css('img')
    html = '<img src="./local.png">'
    assert_equal html, external_mirror_links(html, {})
  end

  def test_unicode_source_and_branch_encoding
    url = ExternalMirror.source_url('owner/repo', 'feature/test', 'docs/a b.md')
    assert_equal 'https://raw.githubusercontent.com/owner/repo/feature%2Ftest/docs/a%20b.md', url
  end

  def test_generation_strips_source_metadata_and_preserves_liquid_examples
    response = Net::HTTPOK.new('1.1', '200', 'OK')
    response.define_singleton_method(:body) { "---\ntitle: source\n---\n{{ title }}\n" }
    generator = ExternalMirror::Generator.new
    generator.define_singleton_method(:fetch_with_redirects) { |_| response }
    post = Struct.new(:data, :content).new(PAGE.dup, '')
    site = Struct.new(:posts).new(Struct.new(:docs).new([post]))
    generator.generate(site)
    assert_equal "{{ title }}\n", post.content
    assert_equal false, post.data['render_with_liquid']
  end

  def test_failed_fetch_does_not_stop_other_posts
    bad = Net::HTTPNotFound.new('1.1', '404', 'Not Found')
    good = Net::HTTPOK.new('1.1', '200', 'OK')
    good.define_singleton_method(:body) { '# Still available' }
    generator = ExternalMirror::Generator.new
    generator.define_singleton_method(:fetch_with_redirects) { |uri| uri.path.end_with?('bad.md') ? bad : good }
    posts = ['bad.md', 'good.md'].map { |p| Struct.new(:data, :content).new(PAGE.merge('external_path' => p), '') }
    generator.generate(Struct.new(:posts).new(Struct.new(:docs).new(posts)))
    assert_includes posts.first.content, 'HTTP 404'
    assert_equal '# Still available', posts.last.content
  end

  def test_post_inventory_has_only_source_references
    files = Dir[File.expand_path('../_posts/[0-9]*.md', __dir__)]
    refute_empty files
    files.each do |file|
      header, body = File.read(file, encoding: 'UTF-8').split(/^---\s*$\n?/, 3).drop(1)
      data = YAML.safe_load(header, permitted_classes: [Date, Time])
      assert_match %r{\Aabarthdew/[^/]+\z}, data.fetch('external_repo'), file
      refute_empty data.fetch('external_path'), file
      refute_empty data.fetch('external_branch'), file
      assert_equal false, data['render_with_liquid'], file
      assert_empty body.strip, file
    end
  end
end
