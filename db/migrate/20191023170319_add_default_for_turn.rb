class AddDefaultForTurn < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :current_turn, :string, default: "white"
  end
end
