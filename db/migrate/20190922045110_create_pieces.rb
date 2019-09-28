class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :game_id
      t.integer :x_position
      t.integer :y_position
      t.integer :user_id
      t.string :piece_type
      t.integer :moves
      t.timestamps
    end
  end
end
