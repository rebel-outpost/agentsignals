class Showing < Event

  belongs_to :client, foreign_key: :contact_id

  validates :contact_id, presence: true
  
  before_save :create_showing_name

  private

  def create_showing_name
    self.name = self.client.full_name
  end
end
