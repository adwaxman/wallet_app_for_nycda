class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :area_code
      t.integer :local_exchange
      t.integer :phone_ending
      t.decimal :cash_balance

      t.timestamps null: false
    end
  end
end
