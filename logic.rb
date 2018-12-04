require_relative 'card'
require_relative 'board'
require 'set'

# Author: Carter Brown
# Date Created: 9/13/18

# Set logic class. Implements the rules of Set.
class Logic

  # Author: Carter Brown
  # Checks if the passed set of cards qualifies as a set.
  # Returns true iff { card1, card2, card3 } is a valid set.
  def self.is_set?(card1, card2, card3)
    # If any cards are nil (empty slots) return false
    return false if (card1.nil? || card2.nil? || card3.nil?)
    color_set = Set[card1.color, card2.color, card3.color]
    symbol_set = Set[card1.symbol, card2.symbol, card3.symbol]
    number_set = Set[card1.number, card2.number, card3.number]
    shade_set = Set[card1.shading, card2.shading, card3.shading]
    # If any set is of size two, the group of cards passed is not a set.
    not (color_set.size == 2 || symbol_set.size == 2 || number_set.size == 2 || shade_set.size == 2)
  end

  # Author: Carter Brown
  # Checks if the board passed contains a set.
  # Returns true iff the current board contains a valid set.
  def self.board_has_set?(board)
    for i in 0...(board.cards.length-2)
      for j in (i+1)...(board.cards.length-1)
        for k in (j+1)...(board.cards.length)
          return true if is_set? board.cards[i], board.cards[j], board.cards[k]
        end
      end
    end
    false
  end

end