require "spec_helper"

describe VersioRac1::Podcast::FeedUrl do
  let(:url)    { "http://www.racalacarta.com/wp-feeder.php?#{params}" }
  let(:params) { "prog=VERSIO+RAC1&param=versio_rac1&limit=100" }

  it "builds the URL" do
    expect(described_class.build).to eq(url)
  end
end
