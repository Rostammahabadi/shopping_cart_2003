class ShoppingCart

  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []

  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    total_quantity = 0
    @products.each do |product|
      total_quantity += product.quantity
    end
    total_quantity
  end


end
