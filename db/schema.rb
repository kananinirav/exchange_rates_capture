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

ActiveRecord::Schema[7.0].define(version: 2023_01_29_140713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currency_exchange_rates", force: :cascade do |t|
    t.bigint "from_id", null: false
    t.bigint "to_id", null: false
    t.date "export_date"
    t.float "exchange_value"
    t.float "previous_variance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id", "to_id", "export_date"], name: "from_to_date", unique: true
    t.index ["from_id"], name: "index_currency_exchange_rates_on_from_id"
    t.index ["to_id"], name: "index_currency_exchange_rates_on_to_id"
  end

  add_foreign_key "currency_exchange_rates", "countries", column: "from_id"
  add_foreign_key "currency_exchange_rates", "countries", column: "to_id"
end
