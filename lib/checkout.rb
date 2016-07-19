require 'yaml'
require_relative 'promotional_rule'

class Checkout
  PRODUCTS = YAML.load_file './lib/products.yaml'

  attr_reader :basket, :raw_total

  def initialize(promotional_rules = PromotionalRule.new)
    @rules = promotional_rules
    @basket = []
    @raw_total = 0
    @total = 0
  end

  def scan(item)
    @basket << item
    @raw_total += PRODUCTS[item][:price]
  end

  def total
    @total = @raw_total
    rules.multibuy_promotion.each do |k, v|
      @total -= @basket.count(k) * multibuy_discount(k) if multibuy?(k)
    end
    @total
  end

  private

  attr_reader :rules

  def multibuy?(item)
    @basket.count(item) >= rules.multibuy_promotion[item][:quantity]
  end

  def multibuy_discount(item)
    PRODUCTS[item][:price] - rules.multibuy_promotion[item][:price]
  end
end