require_relative "../spec_helper"

describe TeamsFetcher do

  it "retrieves team data from GitHub for a given organization" do
    stub_request_for_teams("some-org")

    actual   = TeamsFetcher.fetch_teams("some-org")
    expected = JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_teams_response.json"))

    expect(actual).to eq expected
  end
end
