class TypeClient < ActiveRecord::Base
  belongs_to :state
   validates :name, presence: true, length:{minimum: 3}, uniqueness: true
end
