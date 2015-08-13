class RoyalFlush < Hand; end
class StraightFlush < Hand
  protected

  def equality(other)
    this = set.highest_rank
    that = other.set.highest_rank

    if this > that
      1
    elsif this < that
      -1
    else
      0
    end
  end
end
class FourOfAKind < Hand
  protected

  def equality(other)
    this = set.ranks_with_count(4).first
    that = other.set.ranks_with_count(4).first

    if this > that
      1
    elsif this < that
      -1
    else
      0
    end
  end
end
class FullHouse < Hand
  protected

  def equality(other)
    this = set.ranks_with_count(3).first
    that = other.set.ranks_with_count(3).first

    if this > that
      1
    elsif this < that
      -1
    else
      this = set.ranks_with_count(2).first
      that = other.set.ranks_with_count(2).first
      if this > that
        1
      elsif this < that
        -1
      else
        0
      end
    end
  end
end
class Flush < Hand
  protected

  def equality(other)
    this = set.highest_rank
    that = other.set.highest_rank

    if this > that
      1
    elsif this < that
      -1
    else
      0
    end
  end
end
class Straight < Hand
  protected

  def equality(other)
    this = set.highest_rank
    that = other.set.highest_rank

    if this > that
      1
    elsif this < that
      -1
    else
      0
    end
  end
end
class ThreeOfAKind < Hand
  protected

  def equality(other)
    this = set.ranks_with_count(3).first
    that = other.set.ranks_with_count(3).first

    if this > that
      1
    elsif this < that
      -1
    else
      0
    end
  end
end
class TwoPair < Hand
  protected

  def equality(other)
    this_pairs = set.ranks_with_count(2).sort_by { |r| $RANKS.index(r) }
    that_pairs = other.set.ranks_with_count(2).sort_by { |r| $RANKS.index(r) }

    this = this_pairs.last
    that = that_pairs.last

    if this > that
      1
    elsif this < that
      -1
    else
      this = this_pairs.first
      that = that_pairs.first
      if this > that
        1
      elsif this < that
        -1
      else
        0
      end
    end
  end
end
class OnePair < Hand
  protected

  def equality(other)
    this = set.highest_rank
    that = other.set.highest_rank

    if this > that
      1
    elsif this < that
      -1
    else
      0
    end
  end
end
class Flop < Hand; end
