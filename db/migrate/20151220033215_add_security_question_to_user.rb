class AddSecurityQuestionToUser < ActiveRecord::Migration
  def change
    add_column :users, :securityQuestion1, :string
    add_column :users, :securityQuestion2, :string
    add_column :users, :securityQuestion3, :string
    add_column :users, :securityAnswer1, :string
    add_column :users, :securityAnswer2, :string
    add_column :users, :securityAnswer3, :string
  end
end
