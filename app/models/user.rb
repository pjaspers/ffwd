class User < ApplicationRecord
  devise :omniauthable, :rememberable, :trackable, omniauth_providers: [:lastfm]

  def self.from_last_fm_auth(auth, _resource = nil)
    u = User.find_or_create_by(uid: auth.credentials.name)
    u.update_attributes(token: auth.credentials.token)
    u
  end
end

# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  uid                 :string           default(""), not null
#  token               :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string
#  last_sign_in_ip     :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
