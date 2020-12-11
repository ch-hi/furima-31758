class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string :posta             , null: false
      t.integer :area             , null: false
      t.string :city              , null: false
      t.string :banchi            , null: false
      t.string :building          
      t.string :phonenumber       , null: false
      t.references :buy           , foreign_key: true
      t.timestamps
    end
  end
end
