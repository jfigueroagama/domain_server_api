class Server < ApplicationRecord
  has_and_belongs_to_many :addresses

  # validations
  validates_presence_of :server_name
end
