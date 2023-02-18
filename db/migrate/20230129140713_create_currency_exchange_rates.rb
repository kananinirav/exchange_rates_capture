class CreateCurrencyExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :currency_exchange_rates do |t|
      t.references :from, null: false, foreign_key: { to_table: :countries }
      t.references :to, null: false, foreign_key: { to_table: :countries }
      t.date :export_date
      t.float :exchange_value
      t.float :previous_variance
      t.timestamps
    end
    add_index :currency_exchange_rates, %i[from_id to_id export_date], unique: true, name: 'from_to_date'
  end
end
