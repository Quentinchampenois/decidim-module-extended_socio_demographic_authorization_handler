# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# Inside the development app, the relative require has to be one level up, as
# the Gemfile is copied to the development_app folder (almost) as is.
# Source: https://github.com/mainio/decidim-module-antivirus/blob/master/Gemfile
base_path = ""
base_path = "../" if File.basename(__dir__) == "development_app"
require_relative "#{base_path}lib/decidim/extended_socio_demographic_authorization_handler/version"

gem "decidim", git: "https://github.com/decidim/decidim", branch: Decidim::ExtendedSocioDemographicAuthorizationHandler.decidim_version
gem "decidim-extended_socio_demographic_authorization_handler", path: "."

gem "bootsnap", "~> 1.4"

gem "puma", ">= 5.3.1"
gem "uglifier", "~> 4.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri
  gem "simplecov", "~> 0.19.0"

  gem "decidim-dev", git: "https://github.com/decidim/decidim", branch: Decidim::ExtendedSocioDemographicAuthorizationHandler.decidim_version
end

group :development do
  gem "faker", "~> 2.14"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "rubocop-faker"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end
