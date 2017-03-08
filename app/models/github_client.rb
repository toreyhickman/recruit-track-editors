module GithubClient
  HTTP_CLIENT     = HTTParty
  DEFAULT_HEADERS = { "Accept"        => "application/vnd.github.v3+json",
                      "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
                      "User-Agent"    => "#{APP_NAME} (Ruby)" }


  def self.fetch_teams(org_name)
    fetch(org_teams_endpoint(org_name))
  end

  def self.fetch_members(team_id)
    fetch(team_members_endpoint(team_id))
  end


  private
  def self.fetch(endpoint)
    response = HTTP_CLIENT.get(endpoint, { headers: DEFAULT_HEADERS })
    JSON.parse(response.body)
  end

  def self.org_teams_endpoint(org_name)
    "https://api.github.com/orgs/#{org_name}/teams"
  end

  def self.team_members_endpoint(team_id)
    "https://api.github.com/teams/#{team_id}/members"
  end

end
