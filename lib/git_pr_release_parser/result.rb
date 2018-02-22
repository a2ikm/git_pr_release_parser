class GitPrReleaseParser
  class Result
    attr_reader :release_pull_request, :merged_pull_requests

    def initialize(release_pull_request, merged_pull_requests)
      @release_pull_request = release_pull_request.freeze
      @merged_pull_requests = merged_pull_requests.freeze
    end

    def verify
      if release_pull_request && merged_pull_requests.length > 0
        self
      else
        nil
      end
    end
  end
end
