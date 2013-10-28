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

ActiveRecord::Schema.define(version: 20131028122805) do

  create_table "bosses", force: true do |t|
    t.integer  "service_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ulsneunit_id"
  end

  create_table "reqmaterials", force: true do |t|
    t.string   "assunto"
    t.string   "local_partida"
    t.string   "local_entrega"
    t.datetime "data_entrega"
    t.boolean  "urgente"
    t.string   "observacoes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "boss_id"
    t.integer  "estado",        limit: 255
    t.string   "comentario"
  end

  add_index "reqmaterials", ["user_id"], name: "index_reqmaterials_on_user_id"

  create_table "reqpeople", force: true do |t|
    t.string   "assunto"
    t.string   "local_partida"
    t.string   "local_destino"
    t.string   "local_retorno"
    t.string   "condutor"
    t.integer  "numero_passageiros"
    t.datetime "data_partida"
    t.datetime "data_retorno"
    t.string   "observacoes"
    t.integer  "user_id"
    t.integer  "boss_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estado",             limit: 255
    t.string   "comentario"
  end

  add_index "reqpeople", ["boss_id"], name: "index_reqpeople_on_boss_id"
  add_index "reqpeople", ["user_id"], name: "index_reqpeople_on_user_id"

  create_table "services", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ulsneunits", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nome"
    t.integer  "numero_mecanografico"
    t.string   "email"
    t.string   "contacto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "auth",                 default: false
    t.boolean  "admin",                default: false
    t.integer  "ulsneunit_id"
    t.integer  "service_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["numero_mecanografico"], name: "index_users_on_numero_mecanografico", unique: true
  add_index "users", ["service_id"], name: "index_users_on_service_id"
  add_index "users", ["ulsneunit_id"], name: "index_users_on_ulsneunit_id"

end
