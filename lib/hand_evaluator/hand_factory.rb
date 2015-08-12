class HandFactory
  def initialize(cards_array)
    @set = CardSet.from(cards_array)
  end

  def build
    type = HANDS.select { |k,v| k.call(@set) }.first[1]
    type.new(@set)
  end
end

HANDS = {
  ->(set) { set.royal? && set.flush? }    => RoyalFlush,
  ->(set) { set.straight? && set.flush? } => StraightFlush,
  ->(set) { set.has_rank_with_count?(4) } => FourOfAKind,
  ->(set) { set.full_house? }             => FullHouse,
  ->(set) { set.flush? }                  => Flush,
  ->(set) { set.straight? }               => Straight,
  ->(set) { set.has_rank_with_count?(3) } => ThreeOfAKind,
  ->(set) { set.two_pair? }               => TwoPair,
  ->(set) { set.one_pair? }               => OnePair,
  ->(set) { true }                        => Flop
}