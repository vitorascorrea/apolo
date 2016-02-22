class AddNcfToChamado < ActiveRecord::Migration
  def change
    add_reference :chamados, :ncf, index: true, foreign_key: true
  end
end
