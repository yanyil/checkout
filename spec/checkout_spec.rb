require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new(promotional_rules) }
  let(:promotional_rules) { double :promotional_rules }

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
      before do
        allow(promotional_rules).to receive(:multibuy_discount).and_return 0
        allow(promotional_rules).to receive(:minimum_spend_discount).and_return 0
      end

      it 'gives a total price of the items in basket' do
        checkout.scan(1)
        checkout.scan(2)
        expect(checkout.total).to eq 54.25
      end
    end

    context 'when buying 2 or more lavender hearts' do
      before do
        allow(promotional_rules).to receive(:multibuy_discount).and_return 1.5
        allow(promotional_rules).to receive(:minimum_spend_discount).and_return 0
      end

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

    context 'when spending over £60' do
      before do
        allow(promotional_rules).to receive(:multibuy_discount).and_return 0
        allow(promotional_rules).to receive(:minimum_spend_discount).and_return 7.42
      end

      it 'offers 10% off the purchase' do
        checkout.scan(1)
        checkout.scan(2)
        checkout.scan(3)
        expect(checkout.total).to eq 66.78
      end
    end

    context 'when buying 2 or more lavender hearts and spending over £60' do
      before do
        allow(promotional_rules).to receive(:multibuy_discount).and_return 1.5
        allow(promotional_rules).to receive(:minimum_spend_discount).and_return 8.19
      end

      it 'applies both promotions' do
        checkout.scan(1)
        checkout.scan(2)
        checkout.scan(1)
        checkout.scan(3)
        expect(checkout.total).to eq 73.76
      end
    end
  end
end