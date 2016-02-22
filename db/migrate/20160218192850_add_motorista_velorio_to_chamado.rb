class AddMotoristaVelorioToChamado < ActiveRecord::Migration
  def change
    add_reference :chamados, :motorista_velorio, index: true, foreign_key: true
  end
end
