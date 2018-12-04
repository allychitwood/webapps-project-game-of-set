require 'minitest/autorun'
require 'minitest/spec'
require_relative '../card'

# Author: Daniel Greer - wrote all test cases
# Date Created: 9/13/18

# Test cases for card.rb

describe 'Card' do

  # Creates cards with every possible number, symbol, shading, and color
  before do
    @card_one = Card.new 'one', 'diamond', 'solid', 'red'
    @card_two = Card.new 'two', 'squiggle', 'striped', 'green'
    @card_three = Card.new 'three', 'oval', 'open', 'purple'
  end

  # Tests to make sure Card holds the numbers one, two , and three
  it 'holds the number one' do
    @card_one.number.must_equal 'one'
  end

  it 'holds the number two' do
    @card_two.number.must_equal 'two'
  end

  it 'holds the number three' do
    @card_three.number.must_equal 'three'
  end

  # Tests to make sure Card holds the symbols diamond, squiggle, and oval
  it 'holds diamond shape' do
    @card_one.symbol.must_equal 'diamond'
  end

  it 'holds squiggle shape' do
    @card_two.symbol.must_equal 'squiggle'
  end

  it 'holds oval shape' do
    @card_three.symbol.must_equal 'oval'
  end

  # Tests to make sure Card holds the shadings solid, stripped, open
  it 'holds solid shading' do
    @card_one.shading.must_equal 'solid'
  end

  it 'holds stripped shading' do
    @card_two.shading.must_equal 'striped'
  end

  it 'holds open shading' do
    @card_three.shading.must_equal 'open'
  end

  # Tests to make sure Card holds the colors red, green, and purple
  it 'holds color red' do
    @card_one.color.must_equal 'red'
  end

  it 'holds color green' do
    @card_two.color.must_equal 'green'
  end

  it 'holds color purple' do
    @card_three.color.must_equal 'purple'
  end

  # Tests equality of two cards
  it 'returns false if two cards do not have equal elements' do
    (@card_one == @card_two).must_equal false
  end

  it 'returns true if two cards have equal elements' do
    (@card_one == Card.new('one', 'diamond', 'solid', 'red')).must_equal true
  end

  it 'returns false if the card passed in is nil' do
    (@card_one == nil).must_equal false
  end
end