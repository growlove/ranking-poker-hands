class CardSet
  include Enumerable

  RANKS = %w(2 3 4 5 6 7 8 9 T J Q K A)

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

  def royal?
    %w(T J Q K A).all? { |rank| ranks.include? rank }
  end

  def flush?
    all? { |card| card.suit == cards[0].suit }
  end

  def straight?
    start = first.rank
    start_index = RANKS.index(start)
    end_index = start_index + 4

    ranks == RANKS[start_index..end_index]
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

  def self.from(cards_string)
    cards = cards_string.split.map do |card_string|
      Card.from(card_string)
    end
    new(cards)
  end
end