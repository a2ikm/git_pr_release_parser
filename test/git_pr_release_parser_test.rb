require "test_helper"

class GitPrReleaseParserTest < Minitest::Test
  def test_created
    source = <<-TEXT
^[[0;33;49mTo be released: #40 Update README^[[0m
^[[0;33;49mTo be released: #41 Improve performance^[[0m
^[[0;32;49mSearching for existing release pull requests...^[[0m
^[[0;33;49mCreated pull request: https://github.com/username/repository/pull/42^[[0m
    TEXT

    result = GitPrReleaseParser.parse(source)
    assert_equal ["#40 Update README", "#41 Improve performance"], result.merged_pull_requests
    assert_equal "https://github.com/username/repository/pull/42", result.release_pull_request
  end

  def test_updated
    source = <<-TEXT
^[[0;33;49mTo be released: #40 Update README^[[0m
^[[0;33;49mTo be released: #41 Improve performance^[[0m
^[[0;32;49mSearching for existing release pull requests...^[[0m
^[[0;33;49mUpdated pull request: https://github.com/username/repository/pull/42^[[0m
    TEXT

    result = GitPrReleaseParser.parse(source)
    assert_equal ["#40 Update README", "#41 Improve performance"], result.merged_pull_requests
    assert_equal "https://github.com/username/repository/pull/42", result.release_pull_request
  end

  def test_no_release
    source = <<-TEXT
^[[0;31;49mNo pull requests to be released^[[0m
    TEXT

    result = GitPrReleaseParser.parse(source)
    assert_nil result
  end
end
