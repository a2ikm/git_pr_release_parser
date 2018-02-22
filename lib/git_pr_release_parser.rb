require "git_pr_release_parser/result"
require "git_pr_release_parser/version"

class GitPrReleaseParser
  class <<self
    def parse(source)
      new.parse(source)
    end
  end

  MERGE_REGEXP = /To be released: (.+)\n/
  RELEASE_REGEXP = /(?:Created|Updated) pull request: (.+)\n/

  def parse(source)
    merged = []
    release = nil

    clean(source).each_line do |line|
      case line
      when MERGE_REGEXP
        merged << $1
      when RELEASE_REGEXP
        release = $1
      end
    end

    Result.new(release, merged).verify
  end

  def clean(source)
    source.gsub(/\^\[\[[0-9;]+m/, "")
  end
end
