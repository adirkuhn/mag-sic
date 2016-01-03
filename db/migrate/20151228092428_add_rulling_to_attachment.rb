class AddRullingToAttachment < ActiveRecord::Migration
  def change
    add_reference :attachments, :rulling, index: true, foreign_key: true
  end
end
