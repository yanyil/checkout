require 'checkout'

describe 'User Stories' do
  let(:checkout) { Checkout.new }

  # As a customer
  # So that I can keep track of my order
  # I would like to be able to add items to basket
  it 'addes item to basket' do
    expect{ checkout.scan(1) }.not_to raise_error
  end

  # As a customer
  # So that I know how much I need to pay
  # I would like to be able to check the total of the order
  it 'gives a total price of the items in basket' do
    checkout.scan(1)
    checkout.scan(2)
    expect(checkout.total).to eq 54.25
  end

  # As the marketing team
  # So that customers have a greater incentive to purchase
  # I would like to be able to offer promotions
  it 'offers promotion if you buy 2 or more lavender hearts' do
    checkout.scan(1)
    checkout.scan(1)
    expect(checkout.total).to eq 17
  end

  it 'offers promotion if you spend over £60' do
    checkout.scan(1)
    checkout.scan(2)
    checkout.scan(3)
    expect(checkout.total).to eq 66.78
  end

  it 'can offer both promotions if you buy 2 or more lavender hears and spend over £60' do
    checkout.scan(1)
    checkout.scan(2)
    checkout.scan(3)
    checkout.scan(1)
    expect(checkout.total).to eq 73.76
  end
end