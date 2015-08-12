require "spec_helper"

describe HandFactory do
  let(:factory)  { HandFactory.new(cards) }
  subject(:hand) { factory.build }

  context "with a royal flush" do
    let(:cards) { "TH JH QH KH AH" }

    it { is_expected.to be_a RoyalFlush }
  end

  context "with a straight flush" do
    let(:cards) { "2H 3H 4H 5H 6H" }

    it { is_expected.to be_a StraightFlush }
  end

  context "with a four of a kind" do
    let(:cards) { "2H 2D 2S 2C 4H" }

    it { is_expected.to be_a FourOfAKind }
  end

  context "with a full house" do
    let(:cards) { "2H 2D 3H 3D 3S" }

    it { is_expected.to be_a FullHouse }
  end

  context "with a flush" do
    let(:cards) { "2H 4H 6H 8H TH" }

    it { is_expected.to be_a Flush }
  end

  context "with a straight" do
    let(:cards) { "2H 3D 4H 5H 6H" }

    it { is_expected.to be_a Straight }
  end

  context "with a three of a kind" do
    let(:cards) { "2H 2D 2C 4S 8D" }

    it { is_expected.to be_a ThreeOfAKind }
  end

  context "with two pairs" do
    let(:cards) { "2H 2D 3H 3D AS" }

    it { is_expected.to be_a TwoPair }
  end

  context "with one pair" do
    let(:cards) { "2H 2D 5H 9D KC" }

    it { is_expected.to be_a OnePair }
  end

  context "with a flop" do
    let(:cards) { "2H 4D 6S 9C AH" }

    it { is_expected.to be_a Flop}
  end
end