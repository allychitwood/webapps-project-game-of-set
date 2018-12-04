require_relative 'deck'
require_relative 'logic'
require_relative 'utility'
require_relative 'player'

# Authors: Ally Chitwood (basic structure of prompting player for name and then set),
# Will Greenway (looping structure encompassing prompting for name and set),
# Daniel Greer (asking for 1 or two players, input validation),
# Nathan Simpson (timer implementation),
# Carter Brown (instructions, debugging)
# The main class. Run to start the game

error_msg = %q(ERROR! Invalid input.)
instructions_str =  %q(
Identify a SET of 3 cards from 12 cards. Each card has 4 features:

Number - one, two, or three
Symbol - oval, squiggle, or diamond
Shading - solid, striped, or open
Color - red, purple, or green

A SET is 3 cards in which each of the cards' features,
are the same on each card or are different on each card.

Example: [one, squiggle, striped, green], [two, oval, striped, purple], [three, diamond, striped, red]
because the cards have different numbers, different symbols, same shading, different color

The board will be displayed. Input A, B, or stuck, indicating which player will pick a set or stuck if there
are no sets on the board.

Then input the set. The player will be awarded +-1 to their score depending on if the set given
was valid.

The board indexes are as shown:

1   2   3
4   5   6
7   8   9
10  11  12

And so on if there are more cards added to the board.

)

puts instructions_str

# Creates the deck and board for the game
deck = Deck.new
deck.shuffle!
board = Board.new
board.fill_board deck

# Selects the game mode
game_mode_selection = %q(Select Game Mode (1-player, 2-player): )
printf game_mode_selection
user_selection = gets.chomp!

# Checks for proper game mode input
until user_selection == "1-player" || user_selection == "2-player"
  puts error_msg
  puts game_mode_selection
  user_selection = gets.chomp!
end

# Add player(s) to game
case user_selection
when "1-player"
  name_prompt = %q(Enter your name: )

  # Gets player name
  printf name_prompt
  player_name = gets.chomp!

  # Checks for proper player name input
  until player_name.class == String
    puts error_msg
    printf name_prompt
    player_name = gets.chomp!
  end

  # Creates new player
  board.add_player player_name

when "2-player"
  player_one_prompt = %q(Enter player one's name: )
  player_two_prompt = %q(Enter player two's name: )

  # Gets player one's name
  printf player_one_prompt
  player_one_name = gets.chomp!

  # Checks for proper player name input
  until player_one_name.class == String
    puts error_msg
    printf player_one_prompt
    player_one_name = gets.chomp!
  end

  # Get player two's name
  printf player_two_prompt
  player_two_name = gets.chomp!

  # Checks for proper player name input
  until player_two_name.class == String
    puts error_msg
    printf player_two_prompt
    player_two_name = gets.chomp!
  end

  # Creates new players
  board.add_player player_one_name
  board.add_player player_two_name
end

# Initialize stopwatch
start_time = Time.now
current_time = 0

next_player = ""

# Loop until the board is empty or the deck is empty and the board has no more moves or the player(s) want to quit
until board.cards.length == 0 || (deck.card_arr.length == 0 && !(Logic.board_has_set? board)) || next_player == 'quit game'
  # Display all 12 cards
  board.print_board

  # Prompt players and get input string
  next_player = Utility.get_next_player board

  if next_player == 'quit game'
    # Jumps to ending statements

  elsif next_player == 'stuck'
    # Check if board has a set
    if Logic.board_has_set? board
      puts "\nOops! The board still has a set. Look harder!"
      Utility.print_hint board
      next
    else
      # Add 3 more cards to the board
      Utility.stuck board, deck
    end

  else # player
    if board.players.key? next_player

      # Replace empty spots on board if the move was valid.
      board.fill_board deck if board.players[next_player].next_set board
    else
      puts error_msg
      next
    end
  end

  # Print current time and score
  current_time = Time.now  - start_time  unless next_player == 'quit game'
  puts "Running Game Time: %0.1f seconds" %[current_time] unless next_player == 'quit game'
  board.players.each_value {|player| puts "#{player.name}'s Score: #{player.point_total}"} unless next_player == 'quit game'
end

# Print closing message, final time, score, and average time to find a set
puts "Thank you for playing the Game of Set!"
total_time = current_time
puts "Total Game Time: %0.1f seconds" %[total_time]
board.players.each_value {|player| puts "#{player.name}'s Final Score: #{player.point_total}"}
num_moves = board.num_sets_played
puts "Average Time to Find a Set: %0.1f seconds" %[total_time/num_moves] unless num_moves == 0