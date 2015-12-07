class Attachment < ActiveRecord::Base
  belongs_to :moot
  has_attached_file :path
  do_not_validate_attachment_file_type :path

  def attachment_url(url)
    self.path = open(url)
  end
end
