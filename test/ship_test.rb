require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_attributes
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
    assert_equal 3, cruiser.health
  end

  def test_it_is_sunk
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cruiser.sunk?
  end

  def test_it_can_get_hit
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
    cruiser.hit
    assert_equal 2, cruiser.health
  end

  def test_it_can_sink
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
  end
end
