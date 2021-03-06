module Slack
  module MessageParser
    DEFAULT_TEXT = "These are our current track editor teams and their editors from outside curriculum.  We'd like to have at least two non-curriculum partners serving on each track. If you'd like to sign up to be a track editor, click the link to a team's page and join."
    GREEN = "#36a64f"
    RED   = "#dd0000"

    def self.parse_message_from_teams(teams, channel, text = DEFAULT_TEXT)
      { :channel     => channel,
        :text        => text,
        :as_user     => true,
        :attachments => build_attachments(teams)
        }
    end

    private

    def self.build_attachments(teams)
      teams.map do |team|
        { :color      => color(team),
          :title      => team.name,
          :title_link => team.url,
          :text       => editor_list(team.member_names) }
      end
    end

    def self.editor_list(member_names)
      "editors: #{member_names.join(", ")}".strip
    end

    def self.color(team)
      team.need_members? ? RED : GREEN
    end
  end
end
