require "uri"

module VersioRac1
  module Podcast
    class FeedUrl
      BASE_URL = "http://www.racalacarta.com/wp-feeder.php?"
      DEFAULT_PARAMS = { prog: "VERSIO RAC1", param: "versio_rac1", limit: 100 }

      def self.list(options = {})
        BASE_URL + URI.encode_www_form(params(options))
      end

      def self.params(options = {})
        DEFAULT_PARAMS.merge(options)
      end
    end
  end
end
