class CardSet
  include Enumerable

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def to_a
    map { |card| card.to_s }.to_a
  end

  def highest_rank
    sort_by { |card| $RANKS.index(card.rank) }.last.rank
  end

  def each(&block)
    cards.each(&block)
  end

  def ranks
    map(&:rank).sort_by { |rank| $RANKS.index(rank) }
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

  def royal?
    %w(T J Q K A).all? { |rank| ranks.include? rank }
  end

  def flush?
    all? { |card| card.suit == cards[0].suit }
  end

  def straight?
    start = ranks.first
    start_index = $RANKS.index(start)
    end_index = start_index + 4

    ranks == $RANKS[start_index..end_index]
  end

  def full_house?
    has_rank_with_count?(2) && has_rank_with_count?(3)
  end

  def two_pair?
    ranks_with_count(2).count == 2
  end

  def one_pair?
    ranks_with_count(2).count == 1
  end

  def self.from(cards_array)
    cards = cards_array.map do |card_string|
      Card.from(card_string)
    end
    new(cards)
  end
end