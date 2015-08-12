require "spec_helper"

describe CardSet do
  let(:cards) { "2H 2D 2S 2C 3H" }
  subject(:set) { CardSet.from(cards) }

  describe ".from" do
    it "contains an array of cards created from a string" do
      expect(set.cards).to be_an Array
      expect(set.cards).to all(be_a(Card))
    end
  end

  describe '#ranks' do
    it "lists unique card ranks" do
      expect(set.ranks).to eq ["2", "3"]
    end
  end

  describe '#suits' do
    it "lists unique card suits" do
      expect(set.suits).to eq ["H", "D", "S", "C"]
    end
  end

  describe '#ranks_count' do
    it "counts the number of each card rank" do
      expect(set.ranks_count["2"]).to eq 4
      expect(set.ranks_count["3"]).to eq 1
    end
  end

  describe '#has_rank_with_count?' do
    it "determine whether there is a rank with a specific count" do
      expect(set.has_rank_with_count?(4)).to eq true
    end
  end

  describe '#ranks_with_count' do
    it "finds ranks with a given count" do
      expect(set.ranks_with_count(4)).to eq ["2"]
      expect(set.ranks_with_count(1)).to eq ["3"]
    end

    it "returns an empty array if it doesn't find one" do
      expect(set.ranks_with_count(3)).to eq []
    end
  end

  describe '#royal?' do
    let(:cards) { "TH JH QH KH AH" }
    it "returns true if card set is royal" do
      expect(set.royal?).to be true
    end
  end

  describe '#flush?' do
    let(:cards) { "2H 4H 6H 8H TH" }
    it "returns true if card set is a flush" do
      expect(set.flush?).to be true
    end
  end

  describe '#straight?' do
    let(:cards) { "2H 3D 4C 5S 6H" }
    it "returns true if card set is a straight" do
      expect(set.straight?).to be true
    end
  end

  describe '#full_house?' do
    let(:cards) { "2H 2D 3H 3S 3C" }
    it "returns true if card set is a full house" do
      expect(set.full_house?).to be true
    end
  end

  describe '#two_pair?' do
    let(:cards) { "2H 2D 3H 3D 5S" }
    it "returns true if card set has two pairs" do
      expect(set.two_pair?).to be true
    end
  end

  describe '#one_pair?' do
    let(:cards) { "2H 2D 5S 8C 9D" }
    it "returns true if card set has one pair" do
      expect(set.one_pair?).to be true
    end
  end
end