
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "git_pr_release_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "git_pr_release_parser"
  spec.version       = GitPrReleaseParser::VERSION
  spec.authors       = ["Masato Ikeda"]
  spec.email         = ["masato.ikeda@gmail.com"]

  spec.summary       = %q{Parse git-pr-release output.}
  spec.description   = %q{Parse git-pr-release output.}
  spec.homepage      = "https://github.com/a2ikm/git_pr_release_parser"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
