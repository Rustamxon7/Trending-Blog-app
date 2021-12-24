class AddRuleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rule, :string, default: 'user'
  end
end
