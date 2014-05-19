class Lead < Contact
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :account
  

  accepts_nested_attributes_for :notes, allow_destroy: true
  validates_presence_of :lead_owner

  STATUS      = [['New', 'new'], ['Contacted', 'contacted'], ['Qualified', 'qualified'], ['Disqualified', 'disqualified']]
  SOURCES     = [['Web Lead', 'web'], ['Phone', 'phone'], ['Referral', 'referral'], ['Conference', 'conference']]
  INTERESTS   = [['Buyer', 'buyer'], ['Seller', 'seller'], ['Renter', 'renter'], ['Past Client', 'past_client']]


  def status
    STATUS
  end

  def sources
    SOURCES
  end

  def interests
    INTERESTS
  end


end
