class ClientProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :client
end
