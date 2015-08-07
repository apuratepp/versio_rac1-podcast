require "spec_helper"

describe VersioRac1::Podcast::FeedUrl do
  let(:url)    { "http://www.racalacarta.com/wp-feeder.php?#{params}" }
  let(:params) { "prog=VERSIO+RAC1&param=versio_rac1&limit=#{limit}" }

  describe ".list" do
    context "with no options" do
      let(:limit) { 100 }
      subject     { described_class.list }
      it          { is_expected.to eq(url) }
    end

    context "with limit" do
      let(:limit) { 50 }
      subject     { described_class.list(limit: limit) }
      it          { is_expected.to eq(url) }
    end
  end

  describe ".params" do
    let(:params) do
      { prog: "VERSIO RAC1", param: "versio_rac1", limit: limit }
    end

    context "with no options" do
      let(:limit) { 100 }
      subject     { described_class.params }
      it          { is_expected.to eq(params) }
    end

    context "with limit" do
      let(:limit) { 50 }
      subject     { described_class.params(limit: limit) }
      it          { is_expected.to eq(params) }
    end
  end
end
