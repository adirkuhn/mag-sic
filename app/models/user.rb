class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  #admins
  has_many :company_admins
  has_many :companies, through: :company_admins

  #eleitores
  has_many :company_voters
  has_many :companies_to_vote, through: :company_voters, :source => :company

  validates_length_of :cpf, :minimum => 11, :maximum => 11, :allow_blank => false

  #Login com CPF ou email
  def login=(login)
    @login = login
  end

  def login
    @login || self.cpf || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["cpf = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

end
