class AddFtToMotorista < ActiveRecord::Migration
  def change
    add_column :motoristas, :fim_turno, :integer
  end
end
