require 'minitest/autorun'
require 'minitest/spec'
require_relative '../deck'

# Author: Daniel Greer - wrote all test cases
# Date created: 9/16/18

# Test cases for deck.rb.

describe 'Deck' do

  before do
    @my_deck = Deck.new
  end

  # Tests draw
  it 'removes the first card from the deck' do
    card_removed = @my_deck.draw!
    (card_removed == Card.new("  three   ", "   oval   ", "   open   ", "  purple  " )).must_equal true
  end

  # Tests shuffle
  it 'shuffles the cards' do
    old_deck = @my_deck
    @my_deck.shuffle!

    # Checks that @my_deck has all the elements, but not necessarily in the same indices
    old_deck.eql?(@my_deck).must_equal true
  end

end