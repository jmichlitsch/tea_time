class SubscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :status, :frequency
end
