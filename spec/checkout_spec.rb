require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new(promotional_rules) }
  let(:multibuy_rules) { {001 => {quantity: 2, price: 8.5}} }
  let(:promotional_rules) { double :promotional_rules, multibuy_promotion: multibuy_rules }

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

  describe '#total' do
    context 'when no promotions' do
      it 'gives a total price of the items in basket' do
      checkout.scan(1)
      checkout.scan(2)
      expect(checkout.total).to eq 54.25
    end
    end

    context 'when buying 2 or more lavender hearts' do
      it 'price drops to £8.50' do
        checkout.scan(1)
        checkout.scan(1)
        expect(checkout.total).to eq 17
      end

      it 'items can be scanned in any order' do
        checkout.scan(1)
        checkout.scan(3)
        checkout.scan(1)
        expect(checkout.total).to eq 36.95
      end
    end
  end
end