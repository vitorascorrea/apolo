class AddNcfToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :ncf, :string
  end
end
