require 'checkout'

describe 'User Stories' do
  let(:checkout) { Checkout.new }

  # As a customer
  # So that I can keep track of my order
  # I would like to be able to add items to basket
  it 'addes item to basket' do
    expect{ checkout.scan(1) }.not_to raise_error
  end
end