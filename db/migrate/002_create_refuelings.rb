class CreateRefuelings < ActiveRecord::Migration[6.0]
  def change
    create_table :refuelings, force: true do |t|
      t.float :amount, index: true, null: false
      t.integer :odometer, null: false
      t.float :price
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end