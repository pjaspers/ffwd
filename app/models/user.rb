class User < ApplicationRecord
  devise :omniauthable, :rememberable, :trackable, omniauth_providers: [:lastfm]
end
