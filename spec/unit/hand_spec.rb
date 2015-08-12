require "spec_helper"

describe Hand do
  let(:cards) { %w(2H 3D 5C 6S 9S) }
  let(:set) { CardSet.from(cards) }
  subject(:hand) { HandFactory.new(cards).build }

  it "has a set of cards" do
    expect(hand.set.ranks).to eq set.ranks
    expect(hand.set.suits).to eq set.suits
  end
end