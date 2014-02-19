class Account < ActiveRecord::Base

  validates_presence_of :name, :phone
  validates :name, uniqueness: true

  belongs_to :organization
end
