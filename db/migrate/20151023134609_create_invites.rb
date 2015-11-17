class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :hash
      t.boolean :active, :default => false

      t.timestamps null: false
    end
  end
end
