class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.text :name
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
