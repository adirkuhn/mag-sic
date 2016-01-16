class Company < ActiveRecord::Base
  #validates
  validates_length_of :cnpj, :minimum => 14, :maximum => 14, :allow_blank => false
  validates_presence_of :name

  #plans
  belongs_to :plan

  #invites
  has_many :admin_invite
  has_many :voter_invite

  #moots
  has_many :moots

  #members
  has_many :company_members
  has_many :members, :through => :company_members, source: :user
  has_many :admins, -> { where(:company_members => { :isAdmin => true }) }, through: :company_members, source: :user

  def set_admin
    if self.company_members.admin.count == 0
      self.company_members.first.update_attributes :isAdmin => true
    end
  end

  def admin_add(user)
    user.update_attributes :isAdmin => true
  end

  def admin_delete(user)
    user.update_attributes :isAdmin => false
  end

  def all_members
    User.find_by_sql ["SELECT DISTINCT u.id, u.name, u.created_at, u.cpf, cm.isAdmin FROM users u JOIN company_members cm ON cm.user_id = u.id WHERE cm.company_id = ?", self.id]
  end

  def is_admin(user)
    self.company_members.admin.where(:user_id => user.id).count == 1
  end

  def is_member(user)
    self.company_members.where(:user_id => user.id).count == 1
  end
end
