class CreateMappers < ActiveRecord::Migration[7.0]
  def change
    create_table :mappers do |t|
      t.integer :order_id
      t.integer :food_item_id
      t.string :num_food_item

      t.timestamps
    end
  end
end
