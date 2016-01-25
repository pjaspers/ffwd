class User < ApplicationRecord
  devise :omniauthable, :rememberable, :trackable, omniauth_providers: [:lastfm]

  def self.from_last_fm_auth(auth, _resource = nil)
    u = User.find_or_create_by(uid: auth.credentials.name)
    u.update_attributes(token: auth.credentials.token)
    u
  end
end
