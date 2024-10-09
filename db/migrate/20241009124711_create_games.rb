class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
