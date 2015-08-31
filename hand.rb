class Hand
  attr_reader :hand, :score
  def initialize
    @hand = []
    @score = 0
  end

  def add(card)
    hand << card
    @score = score_update
  end

  def score_update
      aces = []
      score = @hand.inject(0) do |score, card|
        if card.rank.include?("A")
          aces << card
        elsif card.face_card?
          score += 10
        else
          score += card.rank.to_i
        end
        score
      end

      aces.count.times do
        aces.pop
        if (score + 11 + aces.count) > 21
          score += 1
        else
          score += 11
        end
      end
      score
    end
end
