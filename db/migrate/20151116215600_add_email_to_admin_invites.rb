class AddEmailToAdminInvites < ActiveRecord::Migration
  def change
    add_column :admin_invites, :email, :string
    add_column :admin_invites, :cpf, :string, limit: 11
  end
end
