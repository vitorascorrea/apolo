class AddRfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rf, :string, :unique => true
  end
end
