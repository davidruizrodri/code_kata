class Supermarket
  attr_reader :discounts

  def initialize
    @discounts = {}
  end

  def add_discount(category, discount)
    @discounts[category] = discount
  end

  def is_discount_defined?(category)
    !@discounts[category].nil?
  end
end