class CreateCheckObstructionCases < ActiveRecord::Migration[5.2]
  def change
    create_table :check_obstruction_cases do |t|
      t.text :PointA
      t.text :PointB

      t.timestamps  
    end
  end
end
