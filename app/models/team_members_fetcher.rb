module TeamMembersFetcher
  def self.fetch_members(team_id, client = HTTParty)
    response = client.get(endpoint(team_id), { headers: build_headers })
    JSON.parse(response.body)
  end

  private
  def self.endpoint(team_id)
    "https://api.github.com/teams/#{team_id}/members"
  end

  def self.build_headers
    { "Accept" => "application/vnd.github.v3+json",
      "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
      "User-Agent"    => "#{APP_NAME} (Ruby)" }
  end
end
