# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{productwars-api}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Spencer Rogers"]
  s.date = %q{2011-03-16}
  s.description = %q{This gem provides object-like functionality for retrieving and manipulating data from the Product Wars API}
  s.email = %q{spencer@designerpages.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/productwars.rb",
    "lib/productwars/client.rb",
    "lib/productwars/errors.rb",
    "lib/productwars/product.rb",
    "lib/productwars/response.rb",
    "lib/productwars/stats.rb",
    "lib/productwars/war.rb",
    "spec/cassettes/ProductWars/_all_wars/successful_wars_index_request.yml",
    "spec/cassettes/ProductWars/_global_leaders/successful_products_index_request.yml",
    "spec/cassettes/ProductWars/_leaders_in_war/successful_request.yml",
    "spec/cassettes/ProductWars/_leaders_in_war/unsuccessful_request.yml",
    "spec/cassettes/ProductWars/_product/successful_request.yml",
    "spec/cassettes/ProductWars/_product/unsuccessful_request.yml",
    "spec/cassettes/ProductWars/_product_stats/successful_request.yml",
    "spec/cassettes/ProductWars/_product_stats/unsuccessful_request.yml",
    "spec/cassettes/ProductWars/_products_in_war/successful_products_index_request.yml",
    "spec/cassettes/ProductWars/_products_in_war/unsuccessful_request.yml",
    "spec/cassettes/ProductWars/_war/successful_request.yml",
    "spec/cassettes/ProductWars/_war/unsuccessful_request.yml",
    "spec/cassettes/ProductWars/_wars_containing_product/successful_request.yml",
    "spec/cassettes/ProductWars/_wars_containing_product/unsuccessful_request.yml",
    "spec/product_wars_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/spencer1248/product-wars-ruby-api-wrapper}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{API wrapper for productwars.com}
  s.test_files = [
    "spec/product_wars_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["= 0.7.4"])
      s.add_runtime_dependency(%q<hashie>, ["= 1.0.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<vcr>, ["= 1.7.0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["= 2.5.0"])
    else
      s.add_dependency(%q<httparty>, ["= 0.7.4"])
      s.add_dependency(%q<hashie>, ["= 1.0.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<vcr>, ["= 1.7.0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<rspec>, ["= 2.5.0"])
    end
  else
    s.add_dependency(%q<httparty>, ["= 0.7.4"])
    s.add_dependency(%q<hashie>, ["= 1.0.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<vcr>, ["= 1.7.0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<rspec>, ["= 2.5.0"])
  end
end

