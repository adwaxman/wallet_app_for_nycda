class ChangeCashBallanceColDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :cash_balance, from: nil, to: 0
  end
end
