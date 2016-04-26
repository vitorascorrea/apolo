# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160425191035) do

  create_table "chamados", force: :cascade do |t|
    t.string   "status"
    t.datetime "tempo_prox_status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "motorista_velorio_id"
    t.integer  "motorista_sepultamento_id"
    t.integer  "nota"
    t.string   "ncf"
  end

  add_index "chamados", ["motorista_sepultamento_id"], name: "index_chamados_on_motorista_sepultamento_id"
  add_index "chamados", ["motorista_velorio_id"], name: "index_chamados_on_motorista_velorio_id"

  create_table "motoristas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "data_nasc"
    t.string   "n_comunicador"
    t.string   "foto"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "rf"
  end

end
