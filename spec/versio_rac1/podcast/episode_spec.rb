require "spec_helper"

describe VersioRac1::Podcast::Episode do
  let(:description) { "Emis.: 07-08-15 a les 18h" }
  let(:parsed)      { Time.utc(2015, 8, 7, 16) }

  describe ".parse_description" do
    subject { described_class.parse_description(description) }
    it      { is_expected.to eq(parsed) }
  end
end
