class CreateMoots < ActiveRecord::Migration
  def change
    create_table :moots do |t|
      t.string :title
      t.text :description
      t.datetime :voting_start_at
      t.datetime :voting_ending_at

      t.timestamps null: false
    end
  end
end
