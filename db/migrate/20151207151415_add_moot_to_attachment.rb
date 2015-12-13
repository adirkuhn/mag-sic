class AddMootToAttachment < ActiveRecord::Migration
  def change
    add_reference :attachments, :moot, index: true, foreign_key: true
  end
end
