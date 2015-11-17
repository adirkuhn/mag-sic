class CreateCompanyAdmins < ActiveRecord::Migration
  def change
    create_table :company_admins do |t|
      t.string :token
      t.boolean :active
      #t.integer :user_id
      #t.integer :company_id

      t.timestamps null: false
    end

    add_reference :company_admins, :user, foreign_key: true
    add_reference :company_admins, :company, foreign_key: true
    
    add_index :company_admins, [:user_id, :company_id], unique: true
  end
end
