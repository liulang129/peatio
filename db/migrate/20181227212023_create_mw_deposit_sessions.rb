# mw_deposit_sessions tracks the multi step mimblewimble deposit flow
# - txid is a unique id from generated mw deposit file
# - member_id is id of our user
# - received_payload stores the data from sender(user)
# - response_payload stores the data from receiver(galleon)
# - output is mw output commit, which can be found in mw blocks
# - inputs is an array of input commit

# mw_deposit_sessions includes states of the multi step of mw deposit, 
# after user downloads response_payload, it should add an entry to the deposit table.

class CreateMwDepositSessions < ActiveRecord::Migration
  def change
    create_table :mw_deposit_sessions do |t|
      t.string :txid, limit: 36
      t.integer :member_id
      t.decimal :amount, precision: 32, scale: 16
      t.text :received_payload
      t.text :response_payload
      t.string :output, limit: 33
      t.string :inputs, limit: 33, array: true, default: []

      t.timestamps null: false
    end
    add_index :mw_deposit_sessions, :member_id
  end
end
