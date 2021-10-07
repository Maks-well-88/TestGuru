class GitHubClient

  def initialize
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  def last_response
    @client.last_response
  end
end
