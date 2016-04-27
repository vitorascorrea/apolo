class RemoveDataNascFromMotorista < ActiveRecord::Migration
  def change
    remove_column :motoristas, :data_nasc, :timestamp
  end
end
