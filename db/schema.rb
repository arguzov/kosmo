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

ActiveRecord::Schema.define(version: 20141217073634) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "fl_status"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.boolean  "fl_menu"
  end

  create_table "collections", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.boolean  "fl_show"
    t.integer  "unit_id"
  end

  create_table "experts", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "education"
    t.text     "experience"
    t.text     "diploma"
    t.string   "profession"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "fl_order"
  end

  create_table "experts_posts", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "expert_id"
  end

  add_index "experts_posts", ["post_id", "expert_id"], name: "index_experts_posts_on_post_id_and_expert_id", using: :btree

  create_table "experts_services", id: false, force: true do |t|
    t.integer "expert_id"
    t.integer "service_id"
  end

  add_index "experts_services", ["expert_id", "service_id"], name: "index_experts_services_on_expert_id_and_service_id", using: :btree

  create_table "faqs", force: true do |t|
    t.string   "name"
    t.text     "question"
    t.text     "answer"
    t.boolean  "fl_show"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
  end

  create_table "issues", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "title"
    t.string   "description"
    t.boolean  "fl_show"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "url"
  end

  create_table "issues_services", id: false, force: true do |t|
    t.integer "issue_id"
    t.integer "service_id"
  end

  add_index "issues_services", ["issue_id", "service_id"], name: "index_issues_services_on_issue_id_and_service_id", using: :btree

  create_table "items", force: true do |t|
    t.integer  "product_id"
    t.integer  "volume"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicaments", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "service_id"
    t.string   "title"
    t.string   "description"
    t.boolean  "fl_show"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "anounce"
    t.string   "url"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "menus", force: true do |t|
    t.string  "title"
    t.string  "url"
    t.integer "fl_type"
    t.integer "parent_id"
    t.integer "post_id"
    t.integer "category_id"
    t.string  "css_class"
  end

  create_table "orders", force: true do |t|
    t.string   "contacts"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "fl_type",    default: 1
    t.string   "items"
    t.integer  "qty"
    t.integer  "price"
    t.integer  "fl_status",  default: 0
    t.text     "comment"
    t.integer  "manager_id", default: 0
  end

  create_table "posts", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "fl_status"
    t.text     "anounce"
    t.text     "content"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "fl_menu"
    t.string   "url"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "person"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "collection_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "prices"
    t.string   "title"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "fl_show"
  end

  create_table "promos", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.text     "banner"
    t.boolean  "fl_active"
    t.boolean  "fl_top"
    t.datetime "due"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "fl_banner"
  end

  create_table "promos_services", id: false, force: true do |t|
    t.integer "promo_id"
    t.integer "service_id"
  end

  add_index "promos_services", ["promo_id", "service_id"], name: "index_promos_services_on_promo_id_and_service_id", using: :btree

  create_table "redactor_assets", force: true do |t|
    t.integer  "user_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "fl_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.text     "content"
  end

  create_table "sections_services", id: false, force: true do |t|
    t.integer "section_id"
    t.integer "service_id"
  end

  add_index "sections_services", ["section_id", "service_id"], name: "index_sections_services_on_section_id_and_service_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "content"
    t.string   "title"
    t.string   "description"
    t.boolean  "fl_show"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "anounce"
    t.integer  "price"
    t.text     "pricelist"
    t.integer  "parent_id",          default: 0
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "fl_publish"
    t.string   "keys"
    t.integer  "fl_order",           default: 0
    t.string   "complements"
  end

  create_table "services_issues", id: false, force: true do |t|
    t.integer "service_id"
    t.integer "issue_id"
  end

  create_table "units", force: true do |t|
    t.string  "name"
    t.string  "url"
    t.text    "description"
    t.integer "parent"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "discount"
    t.string   "name"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
