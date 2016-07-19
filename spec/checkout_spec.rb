require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }

  describe '#scan' do
    it 'adds item to basket' do
      checkout.scan(1)
      expect(checkout.basket).to eq [1]
    end
  end

  describe '#basket' do
    it 'stores all items added' do
      checkout.scan(1)
      checkout.scan(2)
      checkout.scan(3)
      expect(checkout.basket).to eq [1, 2, 3]
    end
  end
end