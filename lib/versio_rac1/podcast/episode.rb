require "virtus"

module VersioRac1
  module Podcast
    class Episode
      include Virtus.model

      ONE_DAY = 24 * 3600

      attribute :title
      attribute :broadcasted_at
      attribute :link

      def self.all
        Client.list
      end

      def self.find(date)
        all.select do |episode|
          episode.broadcasted_at > date &&
          episode.broadcasted_at < date + ONE_DAY
        end
      end

      def self.from_slop(episode_slop)
        title = episode_slop.title.text
        broadcasted_at = parse_description(episode_slop.at("description").text)
        link = episode_slop.link.text

        new(title: title, broadcasted_at: broadcasted_at, link: link)
      end

      def self.parse_description(description)
        date = description_components(description)
        time = Time.local("20#{date[:year]}",
                          date[:month],
                          date[:day],
                          date[:hour],
                          0,
                          0,
                          "CET")
        time.utc
      end

      def self.description_components(description)
        keys   = [:day, :month, :year, :hour]
        values = description.gsub!("Emis.: ", "").
                             gsub!(" a les ", "-").
                             split("-")
        Hash[keys.zip(values)]
      end
    end
  end
end
