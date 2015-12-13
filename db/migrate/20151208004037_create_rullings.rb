class CreateRullings < ActiveRecord::Migration
  def change
    create_table :rullings do |t|
      t.string :title
      t.string :objective
      t.text :description

      t.timestamps null: false
    end
  end
end
