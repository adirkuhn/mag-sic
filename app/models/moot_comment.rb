class MootComment < ActiveRecord::Base
    belongs_to :moot
    belongs_to :user
end
