class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.text :text
      t.datetime :expires_at

      t.timestamps
    end
  end
end
