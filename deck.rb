require_relative 'card'

# Author: Daniel Greer
# Date Created: 9/12/18

class Deck

  # Author: Will Greenway
  # Returns the cards in the board.
  attr_reader :card_arr

  #Author: Daniel Greer
  def initialize
    @card_arr = create_card_array
  end

  # Author: Daniel Greer
  # Shuffles the cards in place.
  def shuffle!
    @card_arr.shuffle!
  end

  # Author: Daniel Greer
  # Returns the card drawn from the top of the deck.
  # Requires |@card_arr| > 0
  def draw!
    @card_arr.pop
  end

  private

  # Author: Daniel Greer
  # Modified by: Ally Chitwood - switched card_array to use push instead of trying to index.
  # Populates card_arr with all cards in the game of Set
  def create_card_array

    card_array = []

    # Creates string arrays for card attributes
    # Elements are padded with spaces so their lengths are all 10 (for printing the board)
    numbers = ['   one    ', '   two    ', '  three   ']
    symbols = [' diamond  ', ' squiggle ', '   oval   ']
    shadings = ['  solid   ', ' striped  ', '   open   ']
    colors = ['   red    ', '  green   ', '  purple  ']

    # populates card_arr with all the cards in Set
    numbers.each { |number| symbols.each { |symbol| shadings.each { |shading| colors.each { |color|
      card_array.push (Card.new number, symbol, shading, color)
    }}}}

    card_array
  end
end


