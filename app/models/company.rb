class Company < ActiveRecord::Base
  #members
  # has_many :company_members
  # has_many :members, :through => :company_members, :source => :user

  has_many :company_members
  has_many :members, :through => :company_members, source: :user
  has_many :admins, -> { where(:company_members => { :isAdmin => true }) }, through: :company_members, source: :user

  def set_admin
    if self.company_members.admin.count == 0
      self.company_members.first.update_attributes :isAdmin => true
    end
  end

  # #admin users
  # has_many :company_admins
  # has_many :admins, :through=> :company_admins, :source => :user

  # #voters users
  # has_many :company_voters
  # has_many :voters, :through=> :company_voters, :source => :user

  #plans
  belongs_to :plan

  #invites
  has_many :admin_invite
  has_many :voter_invite

  #moots
  has_many :moots

  #validates
  validates_length_of :cnpj, :minimum => 14, :maximum => 14, :allow_blank => false
  validates_presence_of :name
end
