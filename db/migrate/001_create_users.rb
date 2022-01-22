class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, force: true do |t|
      t.integer :uid
    end
  end
end