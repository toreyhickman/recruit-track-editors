require_relative "../spec_helper"

describe TrackEditorTeamBuilder do
  let(:client) { double("client") }
  let(:org_name) { "some-org" }
  let(:builder) { TrackEditorTeamBuilder.new(org_name, client) }

  let(:track_editor_teams) { builder.build_teams }

  describe "building teams" do
    before(:each) do
      allow(client).to receive(:fetch_teams).with(org_name).and_return(JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_teams_response.json")))
      allow(client).to receive(:fetch_members).with(2222222).and_return(JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_team_members_response.json")))
    end


    it "ignores non-track-editor teams" do
      expect(track_editor_teams.length).to eq 1
    end

    describe "building a track editor team" do
      let(:team) { track_editor_teams.first }

      it "builds a team with a name" do
        expect(team.name).to eq "track-editors-for-something"
      end

      it "builds a team with an id" do
        expect(team.id).to eq 2222222
      end

      it "builds a team with a url" do
        expect(team.url).to eq "https://github.com/orgs/#{org_name}/teams/track-editors-for-something"
      end

      describe "building a team with member names" do
        it "ignores members of the curriculum team" do
          expect(team.member_names).to match_array ["teacher", "instructor"]
        end
      end
    end
  end
end
