class Contact < ActiveRecord::Base

  validates :email, uniqueness: true,
                    format: { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                    message: 'Invalid e-mail address' }
  validates_presence_of :first_name, :last_name, :email

  belongs_to :organization


  def full_name
    if self.last_name != nil
      self.first_name + " " + self.last_name
    elsif
      self.first_name
    end
  end

end
