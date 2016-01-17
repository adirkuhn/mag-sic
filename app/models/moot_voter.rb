class MootVoter < ActiveRecord::Base
  belongs_to :user
  belongs_to :moot
end
