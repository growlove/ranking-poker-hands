class CardSet
  include Enumerable

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def each(&block)
    cards.each(&block)
  end

  def ranks
    map(&:rank).uniq
  end

  def suits
    map(&:suit).uniq
  end

  def ranks_count
    each_with_object(Hash.new(0)) { |c, h| h[c.rank] += 1 }
  end

  def has_rank_with_count?(count)
    ranks_count.any? { |_,v| v == count }
  end

  def ranks_with_count(count)
    ranks_count.select { |_, v| v == count }.keys
  end

  def self.from(cards_string)
    cards = cards_string.split.map do |card_string|
      Card.from(card_string)
    end
    new(cards)
  end
end