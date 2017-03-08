require_relative "../spec_helper"

describe TeamMembersFetcher do
  it "retrieves member data from GitHub for a given team id" do
    stub_request_for_team_members(1111111)

    actual   = TeamMembersFetcher.fetch_members(1111111)
    expected = JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_team_members_response.json"))

    expect(actual).to eq expected
  end
end
