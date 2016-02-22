class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.string :status
      t.timestamp :tempo_prox_status

      t.timestamps null: false
    end
  end
end
