class Address < ApplicationRecord
  has_and_belongs_to_many :servers

  # validations
  validates_presence_of :ip_address
end
