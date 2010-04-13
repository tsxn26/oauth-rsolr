# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tsxn-rsolr}
  s.version = "0.12.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Mitchell, Thomas Nguyen"]
  s.date = %q{2010-04-12}
  s.description = %q{RSolr aims to provide a simple and extensible library for working with Solr.  This is a MODIFIED/CUSTOMIZED version that OAuth signs every POST request for 2-legged OAuth.  The original gem was written by Matt Mitchell and is located at http://github.com/mwmitchell/rsolr.}
  s.email = %q{tsxn26@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/rsolr.rb", "lib/rsolr/client.rb", "lib/rsolr/connection.rb", "lib/rsolr/connection/net_http.rb", "lib/rsolr/connection/requestable.rb", "lib/rsolr/connection/utils.rb", "lib/rsolr/message.rb", "lib/rsolr/message/document.rb", "lib/rsolr/message/field.rb", "lib/rsolr/message/generator.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "VERSION", "lib/rsolr.rb", "lib/rsolr/client.rb", "lib/rsolr/connection.rb", "lib/rsolr/connection/net_http.rb", "lib/rsolr/connection/requestable.rb", "lib/rsolr/connection/utils.rb", "lib/rsolr/message.rb", "lib/rsolr/message/document.rb", "lib/rsolr/message/field.rb", "lib/rsolr/message/generator.rb", "tsxn-rsolr.gemspec"]
  s.homepage = %q{http://github.com/tsxn26/tsxn-rsolr}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Tsxn-rsolr", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tsxn-rsolr}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{RSolr aims to provide a simple and extensible library for working with Solr.  This is a MODIFIED/CUSTOMIZED version that OAuth signs every POST request for 2-legged OAuth.  The original gem was written by Matt Mitchell and is located at http://github.com/mwmitchell/rsolr.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<ruby-hmac>, [">= 0"])
    else
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<ruby-hmac>, [">= 0"])
    end
  else
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<ruby-hmac>, [">= 0"])
  end
end
