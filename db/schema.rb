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

ActiveRecord::Schema.define(version: 20150717151337) do

  create_table "brokers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "proyect_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "brokers", ["proyect_id"], name: "index_brokers_on_proyect_id", using: :btree
  add_index "brokers", ["user_id"], name: "index_brokers_on_user_id", using: :btree

  create_table "proyects", force: :cascade do |t|
    t.integer  "zone_id",    limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "proyects", ["user_id"], name: "index_proyects_on_user_id", using: :btree
  add_index "proyects", ["zone_id"], name: "index_proyects_on_zone_id", using: :btree

  create_table "spends", force: :cascade do |t|
    t.integer  "proyect_id",          limit: 4
    t.date     "fecha"
    t.string   "tipo",                limit: 255
    t.decimal  "importe",                           precision: 7, scale: 2
    t.text     "comntarios",          limit: 65535
    t.integer  "comprobante",         limit: 4
    t.integer  "numero_comprobante",  limit: 4
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.string   "ticket_file_name",    limit: 255
    t.string   "ticket_content_type", limit: 255
    t.integer  "ticket_file_size",    limit: 4
    t.datetime "ticket_updated_at"
    t.integer  "status",              limit: 4,                             default: 1
  end

  add_index "spends", ["proyect_id"], name: "index_spends_on_proyect_id", using: :btree
  add_index "spends", ["user_id"], name: "index_spends_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "tipo_usuario",           limit: 4,   default: 1
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "viaticos", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "proyect_id", limit: 4
    t.decimal  "cantidad",             precision: 8, scale: 2
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.date     "fecha"
  end

  add_index "viaticos", ["proyect_id"], name: "index_viaticos_on_proyect_id", using: :btree
  add_index "viaticos", ["user_id"], name: "index_viaticos_on_user_id", using: :btree

  create_table "zones", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "brokers", "proyects"
  add_foreign_key "brokers", "users"
  add_foreign_key "proyects", "users"
  add_foreign_key "proyects", "zones"
  add_foreign_key "spends", "proyects"
  add_foreign_key "spends", "users"
  add_foreign_key "viaticos", "proyects"
  add_foreign_key "viaticos", "users"
end
