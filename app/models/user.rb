class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :leads
  has_many :events
  has_many :tasks
  has_many :showings
  has_many :appointments

  has_one  :subscription
  has_one  :plan, :through => :subscription

  belongs_to :account

  def full_name
    first_name + " " + last_name
  end

end
