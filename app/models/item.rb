# == Schema Information
#
# Table name: items
#
#  id         :bigint(8)        not null, primary key
#  title      :text
#  location   :text
#  latitude   :float
#  longitude  :float
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :user, :optional => true
end
