require_relative "../../spec_helper"

describe Slack::MessageParser do
  let(:team_with_enough_members_1) do
    double("team", {
      :name          => "track-editors-for-something",
      :member_names  => ["teacher", "instructor"],
      :url           => "https://github.com/orgs/some_org/teams/track-editors-for-something",
      :need_members? => false
    })
  end

  let(:team_with_enough_members_2) do
    double("team", {
      :name          => "track-editors-for-other-thing",
      :member_names  => ["other-teacher", "other-instructor"],
      :url           => "https://github.com/orgs/some_org/teams/track-editors-for-other-thing",
      :need_members? => false
    })
  end

  let(:team_with_too_few_members) do
    double("team", {
      :name          => "track-editors-for-another-thing",
      :member_names  => [],
      :url           => "https://github.com/orgs/some_org/teams/track-editors-for-another-thing",
      :need_members? => true
    })
  end


  it "parses track editor teams for posting to Slack" do
    teams = [team_with_enough_members_1, team_with_enough_members_2]

    actual   = Slack::MessageParser.parse_message_from_teams(teams, "#channel", "Announcement")
    expected = JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/slack_message_data_when_teams_have_enough_members.json"), {symbolize_names: true})

    expect(actual).to eq expected
  end

  context "when a team needs members" do
    it "colors the attachment for that team red" do
      teams = [team_with_too_few_members]

      actual   = Slack::MessageParser.parse_message_from_teams(teams, "#channel", "Announcement")
      expected = JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/slack_message_data_when_teams_need_members.json"), {symbolize_names: true})

      expect(actual).to eq expected
    end
  end
end
