$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "versio_rac1/podcast"
require "pry"
require "vcr"

VCR.configure do |config|
  vcr_record_mode = :new_episodes
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
