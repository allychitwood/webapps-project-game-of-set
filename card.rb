# Author: Daniel Greer
# Date Created: 9/12/18

# Holds the attributes for cards in the game of Set.
class Card

  # Author: Daniel Greer
  def initialize(number, symbol, shading, color)
    @number = number
    @symbol = symbol
    @shading = shading
    @color = color
  end

  # Author: Daniel Greer
  # Gets the values of the instance methods.
  attr_reader :number
  attr_reader :symbol
  attr_reader :shading
  attr_reader :color

  # Author: Daniel Greer
  # Checks for equality.
  # Param other_card - an initialized card object.
  # Ensures true iff self == other_card.
  def ==(other_card)
    return false if other_card.nil?
    (@number == other_card.number) && (@symbol == other_card.symbol) && (@shading == other_card.shading) && (@color == other_card.color)
  end

end