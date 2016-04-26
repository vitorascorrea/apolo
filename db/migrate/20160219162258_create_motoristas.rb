class CreateMotoristas < ActiveRecord::Migration
  def change
    create_table :motoristas do |t|
      t.string :nome
      t.timestamp :data_nasc
      t.string :n_comunicador
      t.string :foto

      t.timestamps null: false
    end
  end
end
