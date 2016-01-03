class Moot < ActiveRecord::Base
  #company
  belongs_to :company

  #attachments
  has_many :attachments

  #rulings
  has_many :rullings

  #comments
  has_many :moot_comments
end
