class CreateRullingComments < ActiveRecord::Migration
  def change
    create_table :rulling_comments do |t|
      t.text :comment
      t.timestamps null: false
    end

    add_reference :rulling_comments, :user, index: true, foreign_key: true
    add_reference :rulling_comments, :rulling, index: true, foreign_key: true
  end
end
