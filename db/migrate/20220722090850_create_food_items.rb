class CreateFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :food_type
      t.string :main_ingradient
      t.string :cost
      t.string :img_url
      t.string :available
      t.string :num

      t.timestamps
    end
  end
end
