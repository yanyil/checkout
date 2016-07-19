class Checkout
  PRICE = {001 => 9.25, 002 => 45, 003 => 19.95}

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def scan(item)
    @basket << item
    @total += PRICE[item]
  end
end