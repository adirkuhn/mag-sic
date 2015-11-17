class CreateCompanyVoters < ActiveRecord::Migration
  def change
    create_table :company_voters do |t|
      t.boolean :active

      t.timestamps null: false
    end

    add_reference :company_voters, :user, foreign_key: true
    add_reference :company_voters, :company, foreign_key: true

    add_index :company_voters, [:user_id, :company_id], unique: true
  end
end
