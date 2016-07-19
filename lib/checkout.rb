require 'yaml'

class Checkout
  PRODUCTS = YAML.load_file './lib/products.yaml'

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def scan(item)
    @basket << item
    @total += PRODUCTS[item][:price]
  end
end