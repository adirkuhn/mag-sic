class Attachment < ActiveRecord::Base
  belongs_to :moot
  has_attached_file :path
end
