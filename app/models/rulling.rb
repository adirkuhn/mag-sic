class Rulling < ActiveRecord::Base
  belongs_to :moot

  #attachments
  has_many :attachments

  #comments
  has_many :rulling_comments

  #votes
  has_many :rulling_votes
end
