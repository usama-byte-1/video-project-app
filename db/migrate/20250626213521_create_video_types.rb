class CreateVideoTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :video_types do |t|
      t.string :name
      t.decimal :price
      t.string :format

      t.timestamps
    end
  end
end
