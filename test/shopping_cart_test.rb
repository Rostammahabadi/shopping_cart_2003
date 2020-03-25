require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test

  def test_cart_has_name
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal "King Soopers", cart.name
  end

  def test_cart_has_capacity
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal 30, cart.capacity
  end

  def test_cart_starts_with_no_products
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal [], cart.products
  end

  def test_cart_can_take_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal 2, cart.products.length
  end

end
