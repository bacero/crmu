class ListProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :type_client
end
