class AddDsToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :data_sepultamento, :timestamp
  end
end
