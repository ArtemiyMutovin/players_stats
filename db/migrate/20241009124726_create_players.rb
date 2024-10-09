class CreatePlayers < ActiveRecord::Migration[7.2]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.references :team, foreign_key: true, null: false, index: true
      t.references :role, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
