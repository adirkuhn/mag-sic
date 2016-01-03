class CreateMootComments < ActiveRecord::Migration
  def change
    create_table :moot_comments do |t|
      t.text :comment

      t.timestamps null: false
    end

    add_reference :moot_comments, :user, index: true, foreign_key: true
    add_reference :moot_comments, :moot, index: true, foreign_key: true
  end
end
