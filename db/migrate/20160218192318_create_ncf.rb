class CreateNcf < ActiveRecord::Migration
  def change
    create_table :ncf do |t|
      t.timestamp :data_funeral
      t.timestamp :data_sepultamento
      t.text :lista_itens
      t.string :atendente_responsavel
      t.string :nome_contratante
      t.string :nome_falecido
      t.string :contato_contratante

      t.timestamps null: false
    end
  end
end
