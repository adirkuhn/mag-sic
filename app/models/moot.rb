class Moot < ActiveRecord::Base
  #company
  belongs_to :company

  #attachments
  has_many :attachments
end
