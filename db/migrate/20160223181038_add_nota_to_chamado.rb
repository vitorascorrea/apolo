class AddNotaToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :nota, :integer
  end
end
