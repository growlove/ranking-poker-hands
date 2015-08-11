require "spec_helper"

describe Card do
  subject(:card) { Card.from_string("2H") }

  it "has a rank" do
    expect(card.rank).to eq "2"
  end

  it "has a suit" do
    expect(card.suit).to eq "H"
  end
end