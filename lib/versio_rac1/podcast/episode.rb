require "active_support/core_ext/date_time/calculations"
require "active_support/core_ext/time/zones"
require "virtus"

module VersioRac1
  module Podcast
    class Episode
      include Virtus.model

      ONE_DAY = 24 * 3600
      DESCRIPTION_DATE_FORMAT = "Emis.: %d-%m-%y a les %Hh"
      DESCRIPTION_DATE_TIME_ZONE = "Europe/Berlin"

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
        date_time = DateTime.strptime(description, DESCRIPTION_DATE_FORMAT)
        offset    = date_time.to_time.in_time_zone(DESCRIPTION_DATE_TIME_ZONE).
                              utc_offset
        date_time.change(offset: offset / 3600.0 / 24)
      end
    end
  end
end
