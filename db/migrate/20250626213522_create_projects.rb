class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :raw_footage_link
      t.string :status
      t.references :client, null: false, foreign_key: true
      t.references :pm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
