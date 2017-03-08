require_relative "../spec_helper"

describe TrackEditorTeam do
  let(:team_data) do
    { :name    => "track-editors-for-something",
      :id      => 1234567,
      :members => ["member", "other_member"] }
  end

  let(:team) { TrackEditorTeam.new(team_data) }

  describe "attributes" do
    it "has an id" do
      expect(team.id).to eq 1234567
    end

    it "has a name" do
      expect(team.name).to eq "track-editors-for-something"
    end

    it "has members" do
      expect(team.members).to eq ["member", "other_member"]
    end
  end
end
