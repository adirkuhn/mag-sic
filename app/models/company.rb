class Company < ActiveRecord::Base
  #admin users
  has_many :company_admins
  has_many :admins, :through=> :company_admins, :source => :user

  #voters users
  has_many :company_voters
  has_many :voters, :through=> :company_voters, :source => :user

  #plans
  belongs_to :plan

  #invites
  has_many :admin_invite
  has_many :voter_invite

  #validates
  validates_length_of :cnpj, :minimum => 14, :maximum => 14, :allow_blank => false
  validates_presence_of :name
end
