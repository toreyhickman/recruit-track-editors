module TeamsFetcher
  def self.fetch_teams(org_name, client = HTTParty)
    response = client.get(endpoint(org_name), { headers: build_headers(org_name) })
    JSON.parse(response.body)
  end

  private

  def self.endpoint(org_name)
    "https://api.github.com/orgs/#{org_name}/teams"
  end

  def self.build_headers(org_name)
    { "Accept" => "application/vnd.github.v3+json",
      "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
      "User-Agent"    => org_name }
  end
end
