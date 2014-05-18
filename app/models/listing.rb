# t.string   "title"
# t.decimal  "price",        precision: 10, scale: 0
# t.integer  "house_number"
# t.string   "street_name"
# t.string   "city_name"
# t.string   "zipcode"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.string   "listing_number"
# t.string   "listing_owner"

class Listing < ActiveRecord::Base
  validates_presence_of :title, :price, :street_name, :city_name, :house_number,
                        :zipcode, :listing_number, :listing_owner

  belongs_to :account

  geocoded_by :listing_full_address
  after_validation :geocode

  include Tire::Model::Search
  include Tire::Model::Callbacks

  scope :viewable_on_map, -> { where.not(latitude: nil) }

  def street_address
    if house_number && street_name
      house_number.to_s +  ' ' + street_name
    end
  end

  def listing_full_address
    if street_address && city_name && state && zipcode
      street_address + ', ' + city_name + ' ' + state + ', ' +  zipcode
    end
  end

end
