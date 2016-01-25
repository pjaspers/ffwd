# == Schema Information
#
# Table name: songs
#
#  id             :integer          not null, primary key
#  name           :string
#  artist         :string
#  album          :string
#  last_played_at :datetime
#  duration       :integer
#  artwork        :string
#  external_id    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Song < ApplicationRecord
end
