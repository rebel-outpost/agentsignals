class Event < ActiveRecord::Base

  belongs_to :user

  validates :due_date, presence: true
end
