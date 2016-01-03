class AddSecurityQuestionToUser < ActiveRecord::Migration
  def change
    add_column :users, :securityQuestion1_id, :integer, references: :users
    add_column :users, :securityQuestion2_id, :integer, references: :users
    add_column :users, :securityQuestion3_id, :integer, references: :users
    add_column :users, :securityAnswer1, :string
    add_column :users, :securityAnswer2, :string
    add_column :users, :securityAnswer3, :string
  end
end
