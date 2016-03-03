class Client < ActiveRecord::Base
  belongs_to :state
  belongs_to :type_client
end
