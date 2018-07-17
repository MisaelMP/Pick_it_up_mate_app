# == Schema Information
#
# Table name: items
#
#  id         :bigint(8)        not null, primary key
#  title      :text
#  address    :text
#  latitude   :float
#  longitude  :float
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  condition  :integer
#

class Item < ActiveRecord::Base
  belongs_to :user, :optional => true
  # geocoded_by :address
  after_validation :geocoder_that_works
  validates :address, :presence => true
  validates :image, :presence => true


  private
  def geocoder_that_works
    results = Geocoder.search self.address
    self.latitude = results.first.coordinates.first
    self.longitude = results.first.coordinates.last
  end
end
