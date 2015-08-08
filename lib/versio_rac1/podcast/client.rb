require "faraday"
require "nokogiri"

module VersioRac1
  module Podcast
    class Client
      def self.list(*args)
        parse(fetch(*args))
      end

      def self.fetch(*args)
        response = Faraday.get(FeedUrl.list(*args))

        if response.status == 200
          response.body
        else
          fail ClientError
        end
      end

      def self.parse(body)
        Nokogiri::Slop(body).xpath("//channel//item").map do |item|
          Episode.from_slop(item)
        end
      end
    end

    ClientError = Class.new(StandardError)
  end
end
