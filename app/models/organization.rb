class Organization < ActiveRecord::Base

  validates_presence_of :name, :phone, :max_users
  validates_uniqueness_of :name

  has_many :users
  has_many :leads
  has_many :accounts
  has_many :contacts
  has_many :opportunities

end
