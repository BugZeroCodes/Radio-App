class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.datetime :recited_at
      t.references :user, foreign_key: true
      t.references :announcement, foreign_key: true

      t.timestamps
    end
  end
end
