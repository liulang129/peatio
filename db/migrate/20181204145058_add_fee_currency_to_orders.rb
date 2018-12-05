class AddFeeCurrencyToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :fee_currency
  end
end
