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

ActiveRecord::Schema.define(version: 201511110214202) do

  create_table "admin_invites", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "email"
    t.string   "cpf",        limit: 14
  end

  add_index "admin_invites", ["token", "user_id", "company_id"], name: "index_admin_invites_on_token_and_user_id_and_company_id", unique: true

  create_table "attachments", force: :cascade do |t|
    t.string   "path_file_name"
    t.string   "path_content_type"
    t.integer  "path_file_size"
    t.datetime "path_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "moot_id"
  end

  add_index "attachments", ["moot_id"], name: "index_attachments_on_moot_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "site"
    t.string   "cnpj",       limit: 14
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "plan_id"
  end

  add_index "companies", ["cnpj"], name: "index_companies_on_cnpj", unique: true
  add_index "companies", ["plan_id"], name: "index_companies_on_plan_id"

  create_table "company_admins", force: :cascade do |t|
    t.string   "token"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "company_id"
  end

  add_index "company_admins", ["user_id", "company_id"], name: "index_company_admins_on_user_id_and_company_id", unique: true

  create_table "company_voters", force: :cascade do |t|
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "company_id"
  end

  add_index "company_voters", ["user_id", "company_id"], name: "index_company_voters_on_user_id_and_company_id", unique: true

  create_table "moots", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "voting_start_at"
    t.datetime "voting_ending_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "company_id"
  end

  add_index "moots", ["company_id"], name: "index_moots_on_company_id"

  create_table "plans", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "max_moot_per_year"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.boolean  "is_admin"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "cpf",                    limit: 11
  end

  add_index "users", ["cpf"], name: "index_users_on_cpf", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "voter_invites", force: :cascade do |t|
    t.string   "token"
    t.string   "email"
    t.string   "cpf",        limit: 11
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.integer  "company_id"
  end

  add_index "voter_invites", ["token", "user_id", "company_id"], name: "index_voter_invites_on_token_and_user_id_and_company_id", unique: true

end
