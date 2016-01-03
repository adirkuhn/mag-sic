class RullingComment < ActiveRecord::Base
  belongs_to :rulling
  belongs_to :user
end
