require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }

  describe '#scan' do
    it 'adds item to basket' do
      checkout.scan(1)
      expect(checkout.basket).to eq [1]
    end
  end
end