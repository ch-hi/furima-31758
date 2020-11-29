class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :describe
      t.integer :category_id
      t.integer :condition_id
      t.integer :fee_id
      t.integer :area_id
      t.integer :day_id
      t.integer :payment
      t.references :user
      t.timestamps
    end
  end
end
