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

  def is_full?
    total_quantity = total_number_of_products
    total_quantity >= @capacity
  end

  def products_by_category(category)
    categorical= []
    @products.group_by do |product|
      if product.category == category
        categorical << product.category
      end
    end
    categorical
  end

  def detail
    details = Hash.new()
    details[:name] = @name
    details[:capacity] = @capacity
    details
  end

end
