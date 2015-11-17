class CreateAdminInvites < ActiveRecord::Migration
  def change
    create_table :admin_invites do |t|
      t.string :token

      t.timestamps null: false
    end

    add_reference :admin_invites, :user, foreign_key: true
    add_reference :admin_invites, :company, foreign_key: true

    add_index :admin_invites, [:token, :user_id, :company_id], unique: true
  end
end
