require 'minitest/autorun'
require 'minitest/spec'
require_relative '../logic'
require_relative '../card'

# Author: Carter Brown - wrote all test cases
# Date Created: 9/13/18

# Test cases for logic.rb

describe 'Logic' do

  it 'returns true for: same number, same symbol, same shade, different colors' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'solid', 'green'
    c3 = Card.new 'one', 'diamond', 'solid', 'purple'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: same number, same symbol, different shades, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'striped', 'red'
    c3 = Card.new 'one', 'diamond', 'open', 'red'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: same number, different symbols, same shade, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'squiggle', 'solid', 'red'
    c3 = Card.new 'one', 'oval', 'solid', 'red'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: different numbers, same symbol, same shade, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'two', 'diamond', 'solid', 'red'
    c3 = Card.new 'three', 'diamond', 'solid', 'red'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: different numbers, same symbol, same shade, different colors' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'two', 'diamond', 'solid', 'green'
    c3 = Card.new 'three', 'diamond', 'solid', 'purple'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: same number, different symbols, same shade, different colors' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'squiggle', 'solid', 'green'
    c3 = Card.new 'one', 'oval', 'solid', 'purple'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: same number, same symbol, different shades, different colors' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'striped', 'green'
    c3 = Card.new 'one', 'diamond', 'open', 'purple'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: same number, different symbols, different shades, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'squiggle', 'striped', 'red'
    c3 = Card.new 'one', 'oval', 'open', 'red'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: different numbers, same symbol, different shades, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'two', 'diamond', 'striped', 'red'
    c3 = Card.new 'three', 'diamond', 'open', 'red'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns true for: different numbers, different symbols, same shade, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'two', 'squiggle', 'solid', 'red'
    c3 = Card.new 'three', 'oval', 'solid', 'red'
    Logic.is_set?(c1, c2, c3).must_equal true
  end

  it 'returns false for: same number, same symbol, same shade, two colors' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'solid', 'red'
    c3 = Card.new 'one', 'diamond', 'solid', 'green'
    Logic.is_set?(c1, c2, c3).must_equal false
  end

  it 'returns false for: same number, same symbol, two shades, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'solid', 'red'
    c3 = Card.new 'one', 'diamond', 'striped', 'red'
    Logic.is_set?(c1, c2, c3).must_equal false
  end

  it 'returns false for: same number, two symbols, same shade, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'solid', 'red'
    c3 = Card.new 'one', 'oval', 'solid', 'green'
    Logic.is_set?(c1, c2, c3).must_equal false
  end

  it 'returns false for: two numbers, same symbol, same shade, same color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'solid', 'red'
    c3 = Card.new 'two', 'oval', 'solid', 'green'
    Logic.is_set?(c1, c2, c3).must_equal false
  end

  it 'returns false for: two numbers, two symbols, two shades, two color' do
    c1 = Card.new 'one', 'diamond', 'solid', 'red'
    c2 = Card.new 'one', 'diamond', 'solid', 'red'
    c3 = Card.new 'two', 'oval', 'striped', 'green'
    Logic.is_set?(c1, c2, c3).must_equal false
  end
end