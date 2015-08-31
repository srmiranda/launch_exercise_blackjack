class PlayingCard
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    ['J', 'Q', 'K'].include?(rank)
  end

  def ace?
    rank == 'A'
  end

end
