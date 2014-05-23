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

  has_many :clients, foreign_key: :assignee_id
  has_many :leads, foreign_key: :assignee_id

  has_one  :subscription
  has_one  :plan, through: :subscription

  belongs_to :account

  def full_name
    "#{first_name} #{last_name}"
  end

  def lazy_load_events(start_range, end_range)
    self.events.where("due_date between ? and ? OR ends between ? and ?", start_range, end_range, start_range, end_range)
  end

end
