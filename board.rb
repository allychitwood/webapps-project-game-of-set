require_relative 'deck'
require_relative 'player'
require_relative 'card'

# Author: Nathan Simpson
# Date Created: 9/13/18

# Holds the current cards to be displayed to the user.
class Board
  def initialize
    @initial_board_size = 12
    @cards = Array.new @initial_board_size
    @players = Hash.new
    @num_sets_played = 0
  end

  # Author: Nathan Simpson
  # Returns the cards in the board.
  attr_reader :cards

  # Author: Will Greenway
  # Returns the players in the game.
  attr_reader :players

  # Author: Ally Chitwood
  # Returns the number of sets played.
  attr_accessor :num_sets_played

  # Author: Carter Brown
  # Modified by: Daniel Greer - changed so the board can handle switching from 15 cards displayed to 12
  # Fills all empty slots on the board.
  def fill_board(deck)
    return if deck.card_arr.length == 0

    @cards.length.times {|i| @cards[i] = deck.draw! if @cards[i] == nil} unless @cards.length > 12

    # If there were extra cards on the board, handle it
    if @cards.length > 12

      # Check every index of the regular board output for missing cards
      (@cards.length - 3).times do |i|

        # If a card is missing, replace it with the leftover cards
        if @cards[i] == nil

          # Find a card at the end that isn't empty (and at least one is guaranteed since the normal deck was missing one)
          backwards_counter = @cards.length - 1
          while @cards[backwards_counter] == nil
            backwards_counter -= 1
          end

          # Swap the empty card in the normal output with the card at the end
          temp = @cards[i]
          @cards[i] = @cards[backwards_counter]
          @cards[backwards_counter] = temp

        end


      end
      # Remove nil cards at the end of the array
      3.times { @cards.pop }
    end
  end

  # Author: Ally Chitwood
  # Modified by: Carter Brown - made into one line.
  # Prints out the current cards for the board.
  def print_board
    (@cards.length/3).times {|i| print_row @cards[i*3], @cards[i*3+1], @cards[i*3+2], i*3+1}
  end

  # Author: Carter Brown
  # Prints a 'row' of (3) cards.
  # Param c1, c2, c3 - The cards to display
  # Param index - The index of the first card
  def print_row(c1, c2, c3, index)
    # Handle empty card slots (nil)
    if c1.nil?
      c1_num = '  Empty   '
      c1_sym, c1_shade, c1_color = '          ', '          ', '          '
    else
      c1_num, c1_sym, c1_shade, c1_color = c1.number, c1.symbol, c1.shading, c1.color
    end
    if c2.nil?
      c2_num = '  Empty   '
      c2_sym, c2_shade, c2_color = '          ', '          ', '          '
    else
      c2_num, c2_sym, c2_shade, c2_color = c2.number, c2.symbol, c2.shading, c2.color
    end
    if c3.nil?
      c3_num = '  Empty   '
      c3_sym, c3_shade, c3_color = '          ', '          ', '          '
    else
      c3_num, c3_sym, c3_shade, c3_color = c3.number, c3.symbol, c3.shading, c3.color
    end

    # Pad with space for single digit
    if index <=7
      i1, i2, i3 = "#{index} ", "#{index+1} ", "#{index+2} "
    else
      i1, i2, i3 = "#{index}", "#{index+1}", "#{index+2}"
    end

    row_string =
 %Q(     ___________________       ___________________       ___________________
    |                   |     |                   |     |                   |
    | #{i1}                |     | #{i2}                |     | #{i3}                |
    |    #{c1_num}     |     |    #{c2_num}     |     |    #{c3_num}     |
    |    #{c1_sym}     |     |    #{c2_sym}     |     |    #{c3_sym}     |
    |    #{c1_shade}     |     |    #{c2_shade}     |     |    #{c3_shade}     |
    |    #{c1_color}     |     |    #{c2_color}     |     |    #{c3_color}     |
    |___________________|     |___________________|     |___________________|
    )
    puts row_string
  end

  # Author: Nathan Simpson
  # Reports the score of each player.
  def show_score
    @players.each_value {|p| puts "#{p.name}: #{p.point_total}"}
  end

  # Author: Carter Brown
  # Clears board.
  # Ensures @cards = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  def clear
    @cards = Array.new @initial_board_size
  end

  # Author: Will Greenway
  # Modified by: Nathan Simpson
  # Removes a set from the board.
  def remove_set (set_arr)
    set_arr.each {|card_index| @cards[card_index-1] = nil}
  end

  # Author: Will Greenway
  # Adds name to players
  def add_player (name)
    @players[name] = Player.new name
  end
end