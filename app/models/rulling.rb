class Rulling < ActiveRecord::Base
  belongs_to :moot

  #attachments
  has_many :attachments
end
