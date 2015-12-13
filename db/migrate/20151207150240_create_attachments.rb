class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :path

      t.timestamps null: false
    end
  end
end
