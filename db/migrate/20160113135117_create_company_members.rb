class CreateCompanyMembers < ActiveRecord::Migration
  def change
    create_table :company_members do |t|
      t.boolean :active
      t.boolean :isAdmin
      t.timestamps null: false
    end

    add_reference :company_members, :user, foreign_key: true
    add_reference :company_members, :company, foreign_key: true

    add_index :company_members, [:user_id, :company_id], unique: true

  end
end
