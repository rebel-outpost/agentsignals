class Note < ActiveRecord::Base

  validates_presence_of :note_type, :due_date

  belongs_to :lead
end
