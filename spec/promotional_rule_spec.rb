require 'promotional_rule'

describe PromotionalRule do
  subject(:rule) { described_class.new }

  describe '#multibuy_promotion' do
    it 'returns a hash of multibuy promotion rules' do
      expect(rule.multibuy_promotion).to eq({001 => {quantity: 2, price: 8.5}})
    end
  end
end