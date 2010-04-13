require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('oauth-rsolr', '0.12.1') do |p|
  p.description    = "RSolr aims to provide a simple and extensible library for working with Solr.  This is a CUSTOMIZED version that OAuth signs every POST request for 2-legged OAuth.  Only supports HMAC-SHA1.  The original gem was written by Matt Mitchell and is located at http://github.com/mwmitchell/rsolr."
  p.url            = "http://github.com/tsxn26/tsxn-rsolr"
  p.author         = ["Matt Mitchell", "Thomas Nguyen"]
  p.email          = "tsxn26@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
  p.runtime_dependencies = ["builder >=2.1.2", "ruby-hmac"]
end
