class AddMotoristaSepultamentoToChamado < ActiveRecord::Migration
  def change
    add_reference :chamados, :motorista_sepultamento, index: true, foreign_key: true
  end
end
