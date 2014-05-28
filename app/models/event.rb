class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact

  validates :due_date, presence: true

  validate :end_date_is_after_start_date, if: :end_date?

  default_scope -> { order('due_date DESC') }

  def end_date?
    self.ends.present?
  end

  private

  def end_date_is_after_start_date
    errors.add(:ends, "End date must be after start date") if self.due_date > self.ends
  end
end
