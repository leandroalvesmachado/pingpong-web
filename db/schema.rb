# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_08_024155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "perfis", force: :cascade do |t|
    t.boolean "ativo", default: true, null: false
    t.integer "codigo", null: false
    t.datetime "created_at", null: false
    t.bigint "created_by", null: false
    t.datetime "deleted_at"
    t.bigint "deleted_by"
    t.text "descricao", null: false
    t.string "nome", null: false
    t.datetime "updated_at", null: false
    t.bigint "updated_by", null: false
    t.index ["codigo"], name: "index_perfis_on_codigo", unique: true
    t.index ["deleted_at"], name: "index_perfis_on_deleted_at"
  end

  create_table "usuarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.string "nome", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "usuarios_perfis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "created_by", null: false
    t.datetime "deleted_at"
    t.bigint "deleted_by"
    t.bigint "perfil_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "updated_by", null: false
    t.bigint "usuario_id", null: false
    t.index ["deleted_at"], name: "index_usuarios_perfis_on_deleted_at"
  end

  add_foreign_key "perfis", "usuarios", column: "created_by"
  add_foreign_key "perfis", "usuarios", column: "deleted_by"
  add_foreign_key "perfis", "usuarios", column: "updated_by"
  add_foreign_key "usuarios_perfis", "perfis", column: "perfil_id"
  add_foreign_key "usuarios_perfis", "usuarios"
  add_foreign_key "usuarios_perfis", "usuarios", column: "created_by"
  add_foreign_key "usuarios_perfis", "usuarios", column: "deleted_by"
  add_foreign_key "usuarios_perfis", "usuarios", column: "updated_by"
end
