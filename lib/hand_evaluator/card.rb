class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def self.from_string(card_string)
    re = /([2-9]|[TJQKA])([HDCS])/
    match = card_string.match(re)

    new(match[1], match[2])
  end
end