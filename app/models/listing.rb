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

  def street_address
    house_number.to_s +  ' ' + street_name
  end

end
