class Cart
  attr_reader :products

  def initialize
    @products = Hash.new { |h, k| h[k] = [] }
  end

  def add_product(category, product)
    @products[category] << product
  end
end