class CreateVoterInvites < ActiveRecord::Migration
  def change
    create_table :voter_invites do |t|
      t.string :token
      t.string :email
      t.string :cpf, limit: 11

      t.timestamps null: false
    end

    add_reference :voter_invites, :user, foreign_key: true
    add_reference :voter_invites, :company, foreign_key: true

    add_index :voter_invites, [:token, :user_id, :company_id], unique: true
  end
end
