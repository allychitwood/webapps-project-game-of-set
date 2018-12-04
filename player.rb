require_relative 'utility'
require_relative 'logic'
require_relative 'board'

# Author: Ally Chitwood
# Date Created: 9/13/18

# Holds the information for the current players of Set.
class Player

  # Author: Ally Chitwood
  def initialize (name)
    @name = name
    @point_total = 0
  end

  # Author: Ally Chitwood
  # Handles a user claiming to have found a set, and whether to increase or decrease points.
  # Ensures @point_total += 1 iff the user enters a valid set and @point_total -=1 iff the user enters a non-valid set.
  # Returns true if the resulting move was valid, false if the resulting move was invalid.
  def next_set (current_board)
    next_set = Utility.get_next_set_arr


    if Logic.is_set? current_board.cards[next_set[0] - 1], current_board.cards[next_set[1] - 1], current_board.cards[next_set[2] - 1]
      self.valid_move current_board
      current_board.remove_set next_set
      true
    else
      self.invalid_move
      false
    end
  end

  # Author: Ally Chitwood
  # Returns @point_total.
  attr_reader :point_total

  # Author: Carter Brown
  # Returns @name
  attr_reader :name

  # Author: Ally Chitwood
  # Notifies the user they entered a valid move and increases their point total.
  # Ensures @point_total = @point_total + 1.
  def valid_move board
    puts "Valid move."
    @point_total += 1
    board.num_sets_played += 1
  end

  # Author: Ally Chitwood
  # Notifies the user they entered an invalid move and decreases their point total.
  # Ensures @point_total = @point_total - 1.
  def invalid_move
    puts "Invalid move."
    @point_total -= 1
  end
end

