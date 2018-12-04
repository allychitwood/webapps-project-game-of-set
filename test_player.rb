require 'minitest/autorun'
require 'minitest/spec'
require_relative '../player'

# Author: Ally Chitwood - wrote all test cases
# Date Created: 9/15/18

# Test cases for player.rb.

describe 'Player' do

  it 'has point total' do
    my_player = Player.new 'p_name'
    my_player.must_respond_to :point_total
  end

  it 'has initial point total of 0' do
    my_player = Player.new 'p_name'
    my_player.point_total.must_equal 0
  end

  it 'increments point total by 1' do
    my_player = Player.new 'p_name'
    my_player.valid_move Board.new
    my_player.point_total.must_equal 1
  end

  it 'decrements point total by 1' do
    my_player = Player.new 'p_name'
    my_player.invalid_move
    my_player.point_total.must_equal -1
  end

end