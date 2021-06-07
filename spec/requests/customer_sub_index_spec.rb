require 'rails_helper'

RSpec.describe "customer subscriptions index request" do
  before :each do
    make_teas
    @customer = Customer.first
    @subscription_1 = Subscription.first
    @subscription_2 = Subscription.second
    first_three = Tea.all[0..2]
    next_three = Tea.all[3..5]
    @subscription_1.teas << first_three
    @subscription_2.teas << next_three
    @customer.subscriptions << @subscription_1
    @customer.subscriptions << @subscription_2
    @subscription_2.status = 'cancelled'
  end

  describe "happy path" do
    it "can return in about all the customers subscriptions" do
      get "/api/v1/customers/#{@customer.id}/subscriptions"
      expect(@response).to be_successful
      response = parse(@response)

      expect(response[:data].count).to eq(2)
      expect(response[:data][0].keys).to eq([:id, :type, :attributes])
      expect(response[:data][0][:id]).to be_a(String)
      expect(response[:data][0][:type]).to eq('subscriptions')
      expect(response[:data][0][:attributes].keys).to eq([:title, :price, :status, :frequency])
    end
  end
end
