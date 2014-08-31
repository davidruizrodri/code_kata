module Checkout
  class Product
    attr_reader :category, :price

    def initialize(category, price)
      @category = category
      @price    = price
    end
  end
end