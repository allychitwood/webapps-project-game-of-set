require 'minitest/autorun'
require 'minitest/spec'
require_relative '../deck'
require_relative '../player'
require_relative '../board'
require_relative '../card'
require_relative '../utility'

# Author: Nathan Simpson
# Date Created: 9/16/18

# Test cases for board.rb

describe 'Board' do

  # Author: Nathan Simpson
  it 'prints board size correctly' do
    @my_board = Board.new
    @my_board.cards.length.must_equal 12
  end

  # Author: Nathan Simpson
  it 'clears board' do
    @my_board = Board.new
    @my_deck = Deck.new
    @my_board.fill_board(@my_deck)
    @my_board.clear
    @clear_board = Board.new
    @my_board.cards.must_equal @clear_board.cards
  end

  # Author: Nathan Simpson
  it 'clears empty board correctly' do
    @my_board = Board.new
    @my_board.clear
    @clear_board = Board.new
    @my_board.cards.must_equal @clear_board.cards
  end

  #Author: Will Greenway
  it 'creates two arrays, size 12 and 0' do
    my_board = Board.new
    my_board.cards.length.must_equal 12
    my_board.players.length.must_equal 0
  end

  #Author: Will Greenway
  it 'fills board with 12 cards from deck' do
    my_board = Board.new
    my_deck = Deck.new
    my_deck.card_arr.length.must_equal 81
    my_board.fill_board(my_deck)
    my_board.cards.length.must_equal 12
    my_deck.card_arr.length.must_equal 69
    (my_board.cards & my_deck.card_arr).empty?.must_equal true
  end

  #Author: Will Greenway
  it 'prints board content' do
    my_board = Board.new
    my_deck = Deck.new
    my_deck.shuffle!
    my_board.fill_board(my_deck)
    my_board.print_board
  end

  #Author: Will Greenway
  it 'removes a set from the board' do
    set = [1,5,7]
    my_board = Board.new
    my_deck = Deck.new
    my_board.fill_board my_deck
    removed = [my_board.cards[0],my_board.cards[4],my_board.cards[6]]
    (removed & my_board.cards).empty?.must_equal false
    my_board.remove_set set
    (removed & my_board.cards).empty?.must_equal true
    my_board.cards.length.must_equal 12
  end

  #Author: Will Greenway
  it 'fills spaces in board size >12' do
    set = [1,5,14]
    my_board = Board.new
    my_deck = Deck.new
    my_board.fill_board my_deck
    Utility.stuck my_board, my_deck
    removed = [my_board.cards[0],my_board.cards[4],my_board.cards[13]]
    (removed & my_board.cards).empty?.must_equal false
    my_board.remove_set set
    my_board.fill_board my_deck
    (removed & my_board.cards).empty?.must_equal true
    my_board.cards.length.must_equal 12
  end

  # Author: Daniel Greer
  it 'swaps cards correctly after finding a set in board size > 12' do
    my_board = Board.new
    my_deck = Deck.new
    my_board.fill_board my_deck
    Utility.stuck my_board, my_deck

    my_board.cards[0] = nil
    my_board.cards[4] = nil
    my_board.cards[13] = nil

    my_board.fill_board my_deck

    (my_board.cards[0] != my_board.cards[4] && my_board.cards[4] != my_board.cards[13] && my_board.cards[0] != my_board.cards[13]).must_equal true
    my_board.cards.length.must_equal 12

    my_board.print_board

    my_board.cards.each {|x| x.wont_be_nil }
  end

  #Author: Will Greenway
  it 'makes cards an array of nil values' do
    my_board = Board.new
    my_deck = Deck.new
    my_arr = Array.new 12
    my_board.fill_board(my_deck)
    my_board.clear
    my_board.cards.eql?(my_arr)
  end

end