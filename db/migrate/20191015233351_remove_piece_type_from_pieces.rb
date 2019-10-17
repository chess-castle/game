class RemovePieceTypeFromPieces < ActiveRecord::Migration[5.2]
  def change
    remove_column :pieces, :piece_type
  end
end
