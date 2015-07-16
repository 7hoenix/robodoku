require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/spot'

class SpotTest < Minitest::Test
  def test_it_can_create_a_new_spot
    spot = Spot.new(3, 0, 0)
    assert spot
  end

  def test_spots_have_a_value
    spot = Spot.new(2, 0, 0)
    assert_equal 2, spot.value
  end

  def test_a_new_spot_with_no_value_given_has_nine_possibilities
    spot = Spot.new(0, 0, 0)
    assert_equal 9, spot.possibilities.size
  end

  def test_it_knows_its_location_on_the_board_as_coordinates
    spot = Spot.new(0, 0, 0)
    assert_equal 9, spot.possibilities.size
  end

  def test_it_knows_its_square_on_the_board
    spot = Spot.new(9, 0, 0)
    assert_equal 0, spot.square
  end

  def test_it_knows_its_square_on_the_board
    spot = Spot.new(3, 4, 5)
    assert_equal 4, spot.square
  end

end
