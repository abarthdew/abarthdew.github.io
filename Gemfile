# frozen_string_literal: true

source "https://rubygems.org"

gemspec

# Chirpy 5.x was built before Jekyll's Sass pipeline moved to sass-embedded.
# Keep the older converter line so GitHub Actions does not resolve a newer
# native extension stack that fails on the hosted runner.
gem "jekyll-sass-converter", "~> 2.2"

group :test do
  gem "html-proofer", "~> 3.18"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?

# Jekyll <= 4.2.0 compatibility with Ruby 3.0
gem "webrick", "~> 1.7"
