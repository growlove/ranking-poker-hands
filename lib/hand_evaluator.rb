require "hand_evaluator/card"
require "hand_evaluator/card_set"
require "hand_evaluator/hand"
require "hand_evaluator/hands"
require "hand_evaluator/hand_factory"

class HandEvaluator
  def return_stronger_hand(left, right)
    left = HandFactory.new(left).build
    right = HandFactory.new(right).build

    left > right ? left.to_a : right.to_a
  end
end

$HANDS_LIST = [
  Flop,
  OnePair,
  TwoPair,
  ThreeOfAKind,
  Straight,
  Flush,
  FullHouse,
  FourOfAKind,
  StraightFlush,
  RoyalFlush
]

$RANKS = %w(2 3 4 5 6 7 8 9 T J Q K A)
