class TrackEditorTeam
  attr_reader :id, :name, :members

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @members = args[:members]
  end
end
