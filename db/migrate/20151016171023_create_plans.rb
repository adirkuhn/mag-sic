class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.text :description
      t.integer :max_moot_per_year

      t.timestamps null: false
    end
  end
end
