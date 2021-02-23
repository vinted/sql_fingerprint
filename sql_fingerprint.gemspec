lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sql_fingerprint/version'

Gem::Specification.new do |spec|
  spec.name = 'sql_fingerprint'
  spec.version = SqlFingerprint::VERSION
  spec.authors = ['Laurynas Butkus', 'Tomas Didžiokas']
  spec.email = ['laurynas.butkus@gmail.com', 'tomas.did@gmail.com']
  spec.summary = 'Abstracts SQL query and calculates fingerprint'
  spec.homepage = 'https://github.com/vinted/sql_fingerprint'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
