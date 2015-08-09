require "spec_helper"

describe VersioRac1::Podcast::Episode do
  describe ".all" do
    let(:list) { double("list") }

    before do
      allow(VersioRac1::Podcast::Client).to receive(:list).and_return(list)
    end

    subject { described_class.all }
    it      { is_expected.to eq(list) }
  end

  describe ".find" do
    let(:date) { Time.local(2015, 7, 1) }
    let(:episode1) do
      double("episode", broadcasted_at: Time.local(2015, 6, 30, 18))
    end
    let(:episode2) do
      double("episode", broadcasted_at: Time.local(2015, 7, 1, 18))
    end
    let(:episode3) do
      double("episode", broadcasted_at: Time.local(2015, 7, 2, 18))
    end
    let(:all_espisodes) { [episode1, episode2, episode3] }

    before do
      allow(described_class).to receive(:all).and_return(all_espisodes)
    end

    subject { described_class.find(date) }
    it      { is_expected.to eq([episode2]) }
  end

  describe ".parse_description" do
    context "in DST" do
      let(:description) { "Emis.: 07-01-15 a les 18h" }
      let(:parsed)      { DateTime.new(2015, 1, 7, 17) }

      subject { described_class.parse_description(description) }
      it      { is_expected.to eq(parsed) }
    end

    context "not in DST" do
      let(:description) { "Emis.: 07-07-15 a les 18h" }
      let(:parsed)      { DateTime.new(2015, 7, 7, 16) }

      subject { described_class.parse_description(description) }
      it      { is_expected.to eq(parsed) }
    end
  end
end
