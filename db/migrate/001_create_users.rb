class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, force: true do |t|
      t.integer :uid, null: false, index: { unique: true }
      t.string :locale, default: :en

      t.timestamp
    end
  end
end