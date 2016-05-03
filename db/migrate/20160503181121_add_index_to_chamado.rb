class AddIndexToChamado < ActiveRecord::Migration
  def change
    add_index :chamados, :status
  end
end
