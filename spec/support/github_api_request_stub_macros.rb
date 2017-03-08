module GithubAPIRequestStubMacros
  def stub_request_for_teams(org_name)
    stub_request(:get, "https://api.github.com/orgs/#{org_name}/teams")
      .with(headers: { "Accept" => "application/vnd.github.v3+json",
                       "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
                       "User-Agent"    => "#{APP_NAME} (Ruby)" })
      .to_return(body: File.read("#{APP_ROOT}/spec/fixtures/request_teams_response.json"))
  end

  def stub_request_for_team_members(team_id)
    stub_request(:get, "https://api.github.com/teams/#{team_id}/members")
      .with(headers: { "Accept" => "application/vnd.github.v3+json",
                       "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
                       "User-Agent"    => "#{APP_NAME} (Ruby)" })
      .to_return(body: File.read("#{APP_ROOT}/spec/fixtures/request_team_members_response.json"))
  end
end
