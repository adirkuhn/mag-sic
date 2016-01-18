class CreateRullingVotes < ActiveRecord::Migration
  def change
    create_table :rulling_votes do |t|

      t.string :vote, null: false
      t.timestamps null: false
    end

    add_reference :rulling_votes, :user, foreign_key: true
    add_reference :rulling_votes, :rulling, foreign_key: true

    add_index :rulling_votes, [:user_id, :rulling_id], unique: true
  end
end
