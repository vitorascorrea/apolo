class AddItToMotorista < ActiveRecord::Migration
  def change
    add_column :motoristas, :inicio_turno, :integer
  end
end
