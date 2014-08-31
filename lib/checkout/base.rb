%w(product supermarket cart order_calculator).each { |f| require_relative(f) }

module Checkout
  class Base
    attr_reader :pricing_rules, :cart, :supermarket

    def initialize(pricing_rules)
      @pricing_rules = pricing_rules
      @supermarket   = Checkout::Supermarket.new
      @cart          = Checkout::Cart.new
    end

    def scan(category)
      add_discounts_for(category)
      add_product_to_cart(category)
    end

    def total
      Checkout::OrderCalculator.new(supermarket, cart).total_price
    end

  private

    def add_discounts_for(category)
      discount = pricing_rules[category][:discount]

      if discount && !supermarket.is_discount_defined?(category)
        supermarket.add_discount(category, discount)
      end
    end

    def add_product_to_cart(category)
      product = Product.new(category, pricing_rules[category][:price])
      cart.add_product(category, product)
    end
  end
end

