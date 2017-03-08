module GithubAPIRequestStubMacros
  def stub_request_for_teams(org_name)
    stub_request(:get, "https://api.github.com/orgs/#{org_name}/teams")
      .with(headers: { "Authorization" => "token #{ENV["GITHUB_TOKEN"]}", "User-Agent" => org_name })
      .to_return(body: File.read("#{APP_ROOT}/spec/fixtures/request_teams_response.json"))
  end
end
