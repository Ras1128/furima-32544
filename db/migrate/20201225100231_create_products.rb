class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :name,              null: false
      t.string     :description,       null: false
      t.integer    :price,             null: false
      t.integer    :category_id,       null: false
      t.integer    :item_condition_id, null: false
      t.integer    :postage_id,        null: false
      t.integer    :shipping_area_id,  null: false
      t.integer    :shipping_day_id,   null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
