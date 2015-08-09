require "spec_helper"

describe VersioRac1::Podcast::Client, :vcr do
  describe ".list" do
    subject { described_class.list }
    it      { is_expected.not_to be_nil }

    it "only contains Episodes" do
      expect(subject.map(&:class).uniq).to eq([VersioRac1::Podcast::Episode])
    end
  end
end
