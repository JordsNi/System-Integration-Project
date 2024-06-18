class CreateClaimeds < ActiveRecord::Migration[7.1]
  def change
    create_table :claimeds do |t|
      t.string :item_name
      t.string :description
      t.string :location
      t.string :contact
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
