class PromotionalRule
  MULTIBUY_PROMOTION = {product_code: 001, quantity: 2, price_off: 0.75}
  MINIMUM_SPEND_PROMOTION = {minimum_spend: 60, percent_off: 10}

  def multibuy_discount(basket)
    multibuy?(basket) ? basket.count(product_code) * MULTIBUY_PROMOTION[:price_off] : 0
  end

  def minimum_spend_discount(total)
    minimum_spend?(total) ? total * MINIMUM_SPEND_PROMOTION[:percent_off] / 100.to_f : 0
  end

  private

  def product_code
    MULTIBUY_PROMOTION[:product_code]
  end

  def multibuy?(basket)
    basket.count(product_code) >= MULTIBUY_PROMOTION[:quantity]
  end

  def minimum_spend?(total)
    total > MINIMUM_SPEND_PROMOTION[:minimum_spend]
  end
end