require "spec_helper"

describe Card do
  subject(:card) { Card.from("2H") }

  describe '#rank' do
    it "returns its rank" do
      expect(card.rank).to eq "2"
    end
  end

  describe '#suit' do
    it "returns its suit" do
      expect(card.suit).to eq "H"
    end
  end
end