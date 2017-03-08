class TrackEditorTeam
  DESIRED_MINIMUM_MEMBER_COUNT = 2

  attr_reader :id, :name, :member_names

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @member_names = args[:member_names]
  end

  def need_members?
    member_names.count < DESIRED_MINIMUM_MEMBER_COUNT
  end
end
