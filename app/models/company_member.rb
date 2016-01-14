class CompanyMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  def self.admin
    where(:isAdmin => true)
  end
end
