class AddCpfToUser < ActiveRecord::Migration
  def change
    add_column :users, :cpf, :string, limit: 11

    add_index :users, :cpf, unique: true
  end
end
