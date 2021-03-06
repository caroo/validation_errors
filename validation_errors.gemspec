# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{validation_errors}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["pkw.de dev team"]
  s.date = %q{2010-05-26}
  s.description = %q{Generates markup for validation errors}
  s.email = ["dev@pkw.de"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = [".rake_tasks~", "History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/validation_errors.rb", "lib/validation_errors/helpers/validation_errors_helper.rb", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_validation_errors.rb"]
  s.homepage = %q{http://pkw.de}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{validation_errors}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Generates markup for validation errors}
  s.test_files = ["test/test_helper.rb", "test/test_validation_errors.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.6.0"])
    else
      s.add_dependency(%q<hoe>, [">= 2.6.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.6.0"])
  end
end
