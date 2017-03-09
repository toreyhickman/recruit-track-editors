class TrackEditorTeamBuilder
  TRACK_EDITOR_TEAM_NAME_MATCHER = /\Atrack\-editors\-for/
  CURRICULUM_TEAM = ["sgharms", "toreyhickman"]


  def initialize(org_name, client = GithubClient)
    @org_name = org_name
    @client   = client
  end


  def build_teams
    client.fetch_teams(org_name).each_with_object([]) do |team_data, track_editor_teams|
      next unless for_track_editor_team?(team_data)

      track_editor_teams << build_team(team_data)
    end
  end

  private
  attr_reader :org_name, :client

  def for_track_editor_team?(team_data)
    extract_name(team_data) =~ TRACK_EDITOR_TEAM_NAME_MATCHER
  end

  def build_team(team_data)
    TrackEditorTeam.new({
      :name         => extract_name(team_data),
      :id           => extract_id(team_data),
      :url          => build_url(team_data),
      :member_names => non_curriculum_member_names(extract_id(team_data))
    })
  end

  def extract_name(team_data)
    team_data["name"]
  end

  def extract_id(team_data)
    team_data["id"]
  end

  def build_url(team_data)
    "https://github.com/#{org_name}/teams/#{extract_name(team_data)}"
  end

  def non_curriculum_member_names(team_id)
    member_names(team_id) - CURRICULUM_TEAM
  end

  def member_names(team_id)
    client.fetch_members(team_id).map { |member_data| extract_member_name(member_data) }
  end

  def extract_member_name(member_data)
    member_data["login"]
  end
end
