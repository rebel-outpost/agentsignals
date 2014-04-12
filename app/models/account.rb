class Account < ActiveRecord::Base

  validates_presence_of :name, :phone, :subscription_plan, :max_users
  validates :name, uniqueness: true

  has_many :leads
  has_many :users
  has_many :contacts
  has_many :opportunities
end
