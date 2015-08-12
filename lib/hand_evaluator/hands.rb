class RoyalFlush < Hand; end
class StraightFlush < Hand; end
class FourOfAKind < Hand; end
class FullHouse < Hand; end
class Flush < Hand; end
class Straight < Hand; end
class ThreeOfAKind < Hand; end
class TwoPair < Hand; end
class OnePair < Hand; end
class Flop < Hand; end

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