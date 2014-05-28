# t.string   "first_name", null: false
# t.string   "last_name",  null: false
# t.string   "company"
# t.string   "email",      null: false
# t.string   "phone"
# t.string   "address"
# t.string   "city"
# t.string   "state"
# t.string   "zip"
# t.datetime "created_at"
# t.datetime "updated_at"

class Contact < ActiveRecord::Base

  validates :email, uniqueness: true,
                    format: { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                    message: 'Invalid e-mail address' }

  validates_presence_of :first_name, :last_name, :email

  belongs_to :account

  has_many :offers

  has_many :tasks
  has_many :appointments
  has_many :showings
  
  has_many :notes

  def full_name
    "#{first_name} #{last_name}"
  end
end
