source "https://rubygems.org"

ruby "3.3.4"

gem "fastlane", "~>2.213"
gem "jazzy", "~>0.13"
gem "xcodeproj", "~>1.7"
gem "xcode-install", "~> 2.6.6"
gem "asciidoctor-reducer" 

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
