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

  def self.search(search)
    where('title ILIKE ? OR address ILIKE ?', "%#{search}%", "%#{search}%")
  end

  private
  def geocoder_that_works
    return if self.latitude.present? && self.longitude.present?
    
    results = Geocoder.search(self.address)
    if results.present? && results.first
      self.latitude = results.first.coordinates[0]
      self.longitude = results.first.coordinates[1]
    end
  end
end
