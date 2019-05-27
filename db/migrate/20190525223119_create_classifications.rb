class CreateClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :classifications do |t|
      t.belongs_to :playlist, foreign_key: true
      t.belongs_to :album, foreign_key: true
      t.integer :votes

      t.timestamps
    end
  end
end
