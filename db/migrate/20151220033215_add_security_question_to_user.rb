class AddSecurityQuestionToUser < ActiveRecord::Migration
  def change
    add_reference :users, :securityQuestion1, index: true, foreign_key: true
    add_reference :users, :securityQuestion2, index: true, foreign_key: true
    add_reference :users, :securityQuestion3, index: true, foreign_key: true
    add_column :users, :securityAnswer1, :string
    add_column :users, :securityAnswer2, :string
    add_column :users, :securityAnswer3, :string
  end
end
