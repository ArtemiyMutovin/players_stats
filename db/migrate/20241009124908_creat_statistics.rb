class CreatStatistics < ActiveRecord::Migration[7.2]
  def change
    create_table :statistics do |t|
      t.string :type, null: false
      t.jsonb :metrics, null: false

      t.timestamps
    end
  end
end
