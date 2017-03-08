class TrackEditorTeam
  attr_reader :id, :name, :member_names

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @member_names = args[:member_names]
  end
end
