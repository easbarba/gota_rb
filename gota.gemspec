# frozen_string_literal: true

require_relative 'lib/gota/version'

Gem::Specification.new do |spec|
  spec.name          = 'gota'
  spec.version       = Gota::VERSION
  spec.authors       = ['dynab']
  spec.email         = ['dynab@tutanota.me']

  spec.summary       = 'Unix system utilities front-end'
  # spec.description   = "TODO: Write a longer description or delete this line."
  spec.homepage      = 'https://git.sr.ht/~dynab/gota'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')
  spec.license = 'GPL-3.0'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata['homepage_uri'] = 'https://git.sr.ht/~dynab/gota'
  spec.metadata['source_code_uri'] = 'https://git.sr.ht/~dynab/gota'
  spec.metadata['changelog_uri'] = "https://git.sr.ht/~dynab/gota/refs/v#{spec.version}/History.rdoc"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # requirements
  # spec.requirements << 'ffmpeg'
  # spec.requirements << 'libyaml'
  # spec.requirements << 'mpv'

  # runtime
  spec.add_runtime_dependency 'dry-auto_inject', '~> 0.7.0'
  spec.add_runtime_dependency 'dry-container', '~> 0.7.2'
  spec.add_runtime_dependency 'git', '~> 1.8', '>= 1.8.1'
  spec.add_runtime_dependency 'gli', '~> 2.20'
  spec.add_runtime_dependency 'jaro_winkler', '1.5.4'
  spec.add_runtime_dependency 'tty-spinner', '~> 0.9.3'

  # development
  spec.add_development_dependency 'bundler', '~> 2.2', '>= 2.2.17'
  spec.add_development_dependency 'minitest', '~> 5.14', '>= 5.14.4'
  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  spec.add_development_dependency 'rdoc', '~> 6.3', '>= 6.3.1'
  spec.add_development_dependency 'reek', '~> 6.0', '>= 6.0.4'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.15'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.3'
  spec.add_development_dependency 'rufo', '~> 0.12.0'
  spec.add_development_dependency 'solargraph', '~> 0.40.4'
  spec.add_development_dependency 'yard', '~> 0.9.26'
end
