Tea.delete_all
Subscription.delete_all
Customer.delete_all
SubscriptionTea.delete_all
CustomerSubscription.delete_all

10.times do
  FactoryBot.create :tea
  FactoryBot.create :subscription
  FactoryBot.create :customer
end

first_three = Tea.all[0..2]
last_three = Tea.all[-1..-3]
first_subscription = Subscription.first
last_subscription = Subscription.last
SubscriptionTea.new

first_three.each do |tea|
  SubscriptionTea.create!(tea_id: tea.id, subscription_id:first_subscription.id)
end

last_three.each do |tea|
  SubscriptionTea.create!(tea_id: tea.id, subscription_id:last_subscription.id)
end
