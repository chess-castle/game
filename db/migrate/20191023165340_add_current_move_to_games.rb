class AddCurrentMoveToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :current_turn, :string
  end
end
