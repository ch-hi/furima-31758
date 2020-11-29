class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :describe
      t.integer :category_id     , null: false
      t.integer :condition_id    , null: false
      t.integer :fee_id          , null: false
      t.integer :area_id         , null: false
      t.integer :day_id          , null: false
      t.integer :payment
      t.references :user
      t.timestamps
    end
  end
end
