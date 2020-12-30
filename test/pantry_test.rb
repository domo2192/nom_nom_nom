require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/pantry"
require "pry"
class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({
                    name: "Cheese",
                    unit: "oz",
                    calories: 50
                    })
    @ingredient2 = Ingredient.new({
                    name: "Macaroni",
                    unit: "oz",
                    calories: 200
                    })
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
    assert_equal ({}), @pantry.stock 
  end

  def test_stock_pantry_starts_as_empty_hash
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_stock_starts_at_0
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_restock_adds_to_stock_count
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 7)
    assert_equal 15, @pantry.stock_check(@ingredient1)
    assert_equal 7, @pantry.stock_check(@ingredient2)
  end
end
