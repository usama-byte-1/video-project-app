class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.references :pm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
