class TrackEditorTeam
  DESIRED_MINIMUM_MEMBER_COUNT = 2
  CURRICULUM_MEMBERS = ["sgharms", "toreyhickman"]

  attr_reader :id, :name, :member_names

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @member_names = args[:member_names]
  end

  def need_members?
    non_curriculum_members.count < DESIRED_MINIMUM_MEMBER_COUNT
  end

  private

  def non_curriculum_members
    member_names - CURRICULUM_MEMBERS
  end
end
