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

  describe "needing members" do
    context "when it has two members" do
      it "does not need members" do
        expect(team.need_members?).to be false
      end
    end

    context "when it has less than two members" do
      let(:team_data) do
        { name: "track-editors-for-something", id: 1234567, member_names: ["name"] }
      end

      it "needs members" do
        expect(team.need_members?).to be true
      end
    end

    context "when it has more than two members" do
      let(:team_data) do
        { name: "track-editors-for-something", id: 1234567, member_names: ["name", "other_name", "yet_another_name"] }
      end

      it "does not need members" do
        expect(team.need_members?).to be false
      end
    end
  end
end
