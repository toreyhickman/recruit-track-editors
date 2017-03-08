require_relative "../spec_helper"

describe GithubClient do
  it "retrieves team data from GitHub for a given organization" do
    stub_request_for_teams("some-org")

    actual   = GithubClient.fetch_teams("some-org")
    expected = JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_teams_response.json"))

    expect(actual).to eq expected
  end

  it "retrieves member data from GitHub for a given team id" do
    stub_request_for_team_members(1111111)

    actual   = GithubClient.fetch_members(1111111)
    expected = JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_team_members_response.json"))

    expect(actual).to eq expected
  end

end
