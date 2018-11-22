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

ActiveRecord::Schema.define(version: 20180320105034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.text 'addressline'
    t.string 'street'
    t.string 'city'
    t.string 'state'
    t.string 'pincode'
    t.integer 'type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'addressable_type'
    t.bigint 'addressable_id'
    t.index ['addressable_type', 'addressable_id'], name: 'index_addresses_on_addressable_type_and_addressable_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories_restaurants', id: false, force: :cascade do |t|
    t.bigint 'category_id', null: false
    t.bigint 'restaurant_id', null: false
    t.index ['category_id', 'restaurant_id'], name: 'index_categories_restaurants_on_category_id_and_restaurant_id'
    t.index ['restaurant_id', 'category_id'], name: 'index_categories_restaurants_on_restaurant_id_and_category_id'
  end

  create_table 'food_items', force: :cascade do |t|
    t.string 'name'
    t.decimal 'price'
    t.integer 'food_type'
    t.bigint 'category_id'
    t.bigint 'restaurant_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_food_items_on_category_id'
    t.index ['restaurant_id'], name: 'index_food_items_on_restaurant_id'
  end

  create_table 'home_deliveries', force: :cascade do |t|
    t.integer 'status'
    t.bigint 'master_order_id'
    t.bigint 'address_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address_id'], name: 'index_home_deliveries_on_address_id'
    t.index ['master_order_id'], name: 'index_home_deliveries_on_master_order_id'
  end

  create_table 'master_offers', force: :cascade do |t|
    t.decimal 'total'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'master_orders', force: :cascade do |t|
    t.decimal 'total'
    t.integer 'order_type'
    t.integer 'payment_type'
    t.integer 'order_status'
    t.integer 'payment_status'
    t.string 'transaction_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.bigint 'restaurant_id'
    t.index ['restaurant_id'], name: 'index_master_orders_on_restaurant_id'
    t.index ['user_id'], name: 'index_master_orders_on_user_id'
  end

  create_table 'offers', force: :cascade do |t|
    t.integer 'quantity'
    t.decimal 'price'
    t.bigint 'restaurant_id'
    t.bigint 'food_item_id'
    t.bigint 'master_offer_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['food_item_id'], name: 'index_offers_on_food_item_id'
    t.index ['master_offer_id'], name: 'index_offers_on_master_offer_id'
    t.index ['restaurant_id'], name: 'index_offers_on_restaurant_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.datetime 'order_datetime'
    t.integer 'quantity'
    t.decimal 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'food_item_id'
    t.index ['food_item_id'], name: 'index_orders_on_food_item_id'
  end

  create_table 'restaurant_tables', force: :cascade do |t|
    t.integer 'table_capacity'
    t.boolean 'availability'
    t.bigint 'restaurant_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['restaurant_id'], name: 'index_restaurant_tables_on_restaurant_id'
  end

  create_table 'restaurants', force: :cascade do |t|
    t.string 'name'
    t.string 'phone_no'
    t.string 'email'
    t.time 'opening_time'
    t.time 'closing_time'
    t.integer 'delivery_types'
    t.string 'branch_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.index ['name', 'branch_name'], name: 'index_restaurants_on_name_and_branch_name', unique: true
    t.index ['user_id'], name: 'index_restaurants_on_user_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name', 'resource_type', 'resource_id'], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index ['resource_type', 'resource_id'], name: 'index_roles_on_resource_type_and_resource_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'firstname'
    t.string 'lastname'
    t.string 'username'
    t.string 'phoneno'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index ['user_id', 'role_id'], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'food_items', 'categories'
  add_foreign_key 'food_items', 'restaurants'
  add_foreign_key 'home_deliveries', 'addresses'
  add_foreign_key 'home_deliveries', 'master_orders'
  add_foreign_key 'master_orders', 'restaurants'
  add_foreign_key 'master_orders', 'users'
  add_foreign_key 'offers', 'food_items'
  add_foreign_key 'offers', 'master_offers'
  add_foreign_key 'offers', 'restaurants'
  add_foreign_key 'orders', 'food_items'
  add_foreign_key 'restaurant_tables', 'restaurants'
  add_foreign_key 'restaurants', 'users'
end
