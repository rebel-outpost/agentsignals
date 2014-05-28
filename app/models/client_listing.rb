class ClientListing < ActiveRecord::Base

  belongs_to :client, foreign_key: :user_id
  belongs_to :listing

  validates :client, :listing, presence: true
  validates :client, uniqueness: {scope: :listing}

  scope :renting, -> { where(renting: true) }
  scope :selling, -> { where(selling: true) }
  scope :looking, -> { where(selling: false, renting: false) }
end
