class AddDvToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :data_velorio, :timestamp
  end
end
