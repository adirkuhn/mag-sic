class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :site
      t.string :cnpj

      t.timestamps null: false
    end
  end
end
