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

  def full_name
    if self.last_name != nil
      self.first_name + " " + self.last_name
    elsif
      self.first_name
    end
  end

end
