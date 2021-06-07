class DropSubscriptions < ActiveRecord::Migration[6.1]
  def change
    drop_table :subscriptions
  end
end
