# t.string   "title"
# t.decimal  "price",        precision: 10, scale: 0
# t.integer  "house_number"
# t.string   "street_name"
# t.string   "city_name"
# t.string   "zipcode"
# t.datetime "created_at"
# t.datetime "updated_at"

class Listing < ActiveRecord::Base
  validates_presence_of :title, :price, :street_name, :city_name
end
