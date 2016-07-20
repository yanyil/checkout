require 'promotional_rule'

describe PromotionalRule do
  subject(:rule) { described_class.new }

  describe '#multibuy_discount' do
    it 'returns 0 for unqualified purchase' do
      expect(rule.multibuy_discount([1])).to eq 0
    end

    it 'returns multibuy discount amount' do
      expect(rule.multibuy_discount([1, 1])).to eq 1.5
    end
  end

  describe '#minimum_spend_discount' do
    it 'returns minimum spend discount amount' do
      expect(rule.minimum_spend_discount(61)).to eq 6.1
    end

    it 'returns 0 for unqualified purchase' do
      expect(rule.minimum_spend_discount(59)).to eq 0
    end
  end
end