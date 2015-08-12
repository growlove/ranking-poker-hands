class Hand
  include Comparable

  attr_reader :set

  def initialize(card_set)
    @set = card_set
  end

  def <=>(other)
    this = $HANDS_LIST.index(self.class)
    that = $HANDS_LIST.index(other.class)

    if this > that
      1
    elsif this < that
      -1
    elsif this == that
      equality(other)
    else
      nil
    end
  end

  def equality
  end
end