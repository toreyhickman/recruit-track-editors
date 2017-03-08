require_relative "../spec_helper"

describe TrackEditorTeam do
  let(:team_data) do
    { name: "track-editors-for-something", id: 1234567, member_names: ["name", "other_name"] }
  end

  let(:team) { TrackEditorTeam.new(team_data) }

  describe "attributes" do
    it "has an id" do
      expect(team.id).to eq 1234567
    end

    it "has a name" do
      expect(team.name).to eq "track-editors-for-something"
    end

    it "has a list it member's names" do
      expect(team.member_names).to eq ["name", "other_name"]
    end
  end
end
