# -*- encoding: utf-8 -*-
# stub: devise-token_authenticatable 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "devise-token_authenticatable"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sebastian Oelke"]
  s.date = "2014-10-24"
  s.description = "This gem provides the extracted Token Authenticatable module of devise.\n                          It enables the user to sign in via an authentication token. This token\n                          can be given via a query string or HTTP Basic Authentication."
  s.email = ["dev@sohleeatsworld.de"]
  s.homepage = "https://github.com/baschtl/devise-token_authenticatable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Provides authentication based on an authentication token for devise 3.2 and up."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<devise>, ["~> 3.4.0"])
      s.add_development_dependency(%q<rails>, ["~> 4.1.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.0.2"])
      s.add_development_dependency(%q<pry>, ["~> 0.10.0"])
      s.add_development_dependency(%q<factory_girl_rails>, ["~> 4.4.0"])
      s.add_development_dependency(%q<timecop>, ["~> 0.7.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
    else
      s.add_dependency(%q<devise>, ["~> 3.4.0"])
      s.add_dependency(%q<rails>, ["~> 4.1.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.0.2"])
      s.add_dependency(%q<pry>, ["~> 0.10.0"])
      s.add_dependency(%q<factory_girl_rails>, ["~> 4.4.0"])
      s.add_dependency(%q<timecop>, ["~> 0.7.0"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<devise>, ["~> 3.4.0"])
    s.add_dependency(%q<rails>, ["~> 4.1.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.0.2"])
    s.add_dependency(%q<pry>, ["~> 0.10.0"])
    s.add_dependency(%q<factory_girl_rails>, ["~> 4.4.0"])
    s.add_dependency(%q<timecop>, ["~> 0.7.0"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
  end
end
