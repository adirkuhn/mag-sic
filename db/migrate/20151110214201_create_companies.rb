class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :site
      t.string :cnpj, limit: 14

      t.timestamps null: false
    end

    add_index :companies, :cnpj, unique: true
  end
end
