class Opportunity < ActiveRecord::Base

  validates_presence_of :opportunity_name, :contact_name, :owner

  belongs_to :account


  TYPES  = [['New Customer', 'new_customer'], ['Existing Customer', 'existing_customer']]
  STAGES = [['Prospecting', 'prospecting'], ['Proposal', 'proposal'], ['Analysis', 'analysis'], ['Presentation', 'presentation'], ['Negotiation', 'negotiation'], ['Final Review', 'final_review'], ['Closed/Won','closed_won'], ['Closed/Lost', 'closed_lost']]

  class << self

    def types
      TYPES
    end

    def stages
      STAGES
    end

  end

end
