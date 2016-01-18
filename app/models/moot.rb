class Moot < ActiveRecord::Base
  #company
  belongs_to :company

  #attachments
  has_many :attachments

  #rulings
  has_many :rullings

  #comments
  has_many :moot_comments

  #users that can vote in this moot
  has_many :moot_voters
  has_many :users_can_vote, :through => :moot_voters, source: :user

  def list_users_can_vote
    User.find_by_sql ["SELECT DISTINCT u.id, u.name, u.created_at, u.cpf FROM users u JOIN moot_voters mv ON mv.user_id = u.id WHERE mv.moot_id = ?", self.id]
  end

  def user_can_vote?(user)
    self.moot_voters.where(:user => user, :moot => self).count == 1
  end

  def add_user_can_vote(user)
    if self.company.is_member(user)
      mv = MootVoter.new
      mv.moot = self
      mv.user = user

      if mv.save
        return true
      end
    end

    return false
  end

  def delete_user_can_vote(user)
    if self.company.is_member(user)
      mv = MootVoter.find_by_user_id_and_moot_id(user, self)
      if mv && mv.destroy
        return true
      end
    end

    return false
  end
end
