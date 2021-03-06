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

  def percentage_occupied
    occupied = total_number_of_products
    return (occupied / @capacity.to_f).round(4)*100
  end

  def sorted_products_by_quantity
    quantity = @products.map.sort_by do |product|
      product.to_s.length
    end
  end

  def product_breakdown
    breakdown = Hash.new()
    #issue: it is rewriting the :paper key when i need it to add it to
    #the existing hash key :paper
    @products.group_by do |product|
      breakdown[product.category] = product
    end

  end

end
