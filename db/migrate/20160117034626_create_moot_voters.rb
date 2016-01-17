class CreateMootVoters < ActiveRecord::Migration
  def change
    create_table :moot_voters do |t|

      t.timestamps null: false
    end

    add_reference :moot_voters, :user, foreign_key: true
    add_reference :moot_voters, :moot, foreign_key: true

    add_index :moot_voters, [:user_id, :moot_id], unique: true
  end
end
