class AddOcupadoToMotorista < ActiveRecord::Migration
  def change
    add_column :motoristas, :ocupado, :boolean, :default => false
  end
end
