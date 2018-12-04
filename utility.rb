require_relative 'board'
require_relative 'deck'
require_relative 'logic'

# Author: Carter Brown
# Date Created: 9/15/18

# Utility class to use in set_game.rb for getting input, printing a hint,
# and printing extra cards to the console if stuck.
class Utility

  # Author: Carter Brown
  # Modified by: Daniel Greer - input validation.
  # Gets input indicating who will attempt identify the next set off the board.
  # Returns string.
  def self.get_next_player(board)
    found_set_prompt = %q(Who found a set? Enter name, "stuck", or "quit game": )
    error_msg = %q(ERROR! Invalid input.)
    print found_set_prompt
    name = gets.chomp!

    # Checks for valid user input
    until (board.players.key? name) || (name == 'stuck') || (name == 'quit game')
      puts error_msg
      print found_set_prompt
      name = gets.chomp!
    end
    name
  end

  # Author: Carter Brown
  # Assumes the passed board has set.
  # Prints a hint on how to find a set for the current state of the board.
  def self.print_hint(board)
    for i in 0...(board.cards.length-2)
      for j in (i+1)...(board.cards.length-1)
        for k in (j+1)...(board.cards.length)
          if Logic.is_set? board.cards[i], board.cards[j], board.cards[k]
            card_index = [i, j, k].shuffle!.pop
            hint_str = %Q(
            Hint - The card with:

            #{board.cards[card_index].number.delete " "}
            #{board.cards[card_index].symbol.delete " "}
            #{board.cards[card_index].shading.delete " "}
            #{board.cards[card_index].color.delete " "}

            Is part of a set on the board.
            )
            puts hint_str
            return
          end
        end
      end
    end
  end

  # Author: Ally Chitwood
  # Modified by: Daniel Greer - input validation.
  # Gets input indicating which cards the user thinks is a set.
  def self.get_next_set_arr
    card_set_prompt = %q(Enter the 3 card numbers for your potential set (Ex: 4, 8, 9): )
    error_msg = %q(ERROR! Invalid input.)

    print card_set_prompt
    indices_arr = gets.chomp!.split(%r{,\s*})

    until indices_arr.length == 3 && indices_arr[0].is_i? && indices_arr[1].is_i? && indices_arr[2].is_i?
      puts error_msg
      print card_set_prompt
      indices_arr = gets.chomp!.split(%r{,\s*})
    end

    indices_arr.map! { |x| x.to_i }
  end

  # Author: Ally Chitwood
  # Adds 3 cards to board.
  def self.stuck (board, deck)
    puts "\nThe board did not have a set! Adding 3 more cards for the board!\n"
    3.times {board.cards.push deck.draw!}
  end
end

# Author: Daniel Greer
class String
  def is_i?
    !!(self =~ /\A\d+\z/)
  end
end