class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :description
      t.string :location
      t.string :image

      t.timestamps
    end
  end
end
