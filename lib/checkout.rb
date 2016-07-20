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
    apply_discounts
    @total.round(2)
  end

  private

  attr_reader :rules

  def apply_discounts
    @total -= rules.multibuy_discount(@basket)
    @total -= rules.minimum_spend_discount(@total)
  end
end