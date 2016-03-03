class Labor < ActiveRecord::Base
  belongs_to :area_aim
  belongs_to :project
  belongs_to :state
end
