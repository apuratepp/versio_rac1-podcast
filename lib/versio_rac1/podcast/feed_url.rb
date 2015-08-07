require "uri"

module VersioRac1
  module Podcast
    class FeedUrl
      BASE_URL = "http://www.racalacarta.com/wp-feeder.php?"
      DEFAULT_PARAMS = { prog: "VERSIO RAC1", param: "versio_rac1", limit: 100 }

      def self.build
        BASE_URL + URI.encode_www_form(DEFAULT_PARAMS)
      end
    end
  end
end
