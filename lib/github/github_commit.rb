class GithubCommit
  attr_reader :attributes, :repo_path

  def initialize(repo_path, attributes)
    @repo_path  = repo_path
    @attributes = attributes
  end

  def sha
    attributes['sha']
  end

  def author
    attributes['commit']['author']['name']
  end

  def time
    Time.parse(attributes['commit']['author']['date'])
  end

  def url
    attributes['html_url']
  end

  def shorten_sha(sha_literal)
    sha_literal[0..7]
  end

  def shorten_url(url)
    url.gsub(sha, shorten_sha(sha))
  end

  def formatted_message
    "commit [#{shorten_sha(sha)}] pushed to #{repo_path} by #{author} @ #{time.to_formatted_s} => #{shorten_url(url)}"
  end
end
