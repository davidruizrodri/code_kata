module Checkout
  class OrderCalculator
    attr_reader :supermarket, :cart, :total

    def initialize(supermarket, cart)
      @supermarket = supermarket
      @cart        = cart
      @total       = 0
    end

    def total_price
      each_product_from_cart do |category, products, discount|
        if discount
          quantity, special_price = discount.values_at(:quantity, :special_price)

          products.each_slice(quantity) do |prod_group|
            @total += prod_group.size < quantity ? products_sum(prod_group) : special_price
          end
        else
          @total += products_sum(products)
        end
      end

      total
    end

  private

    def products_sum(products_group)
      products_group.reduce(0) { |sum, p| sum += p.price }
    end

    def discount_for(category)
      supermarket.discounts[category]
    end

    def each_product_from_cart
      cart.products.each do |category, products|
        discount = discount_for(category)
        yield(category, products, discount)
      end
    end
  end
end