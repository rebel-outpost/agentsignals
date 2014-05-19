class Client < Contact

  belongs_to :user

  has_many :client_listings, foreign_key: :user_id, dependent: :destroy
  has_many :listings, through: :client_listings, source: :listing 

end
