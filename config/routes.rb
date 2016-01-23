Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "player#show"
  devise_scope :user do
    get "/users/auth/:provider" => "users/omniauth_callbacks#passthru"
    get "sign_in", :to => "users/sessions#new", :as => :new_user_session
    delete "sign_out", :to => "users/sessions#destroy", :as => :destroy_user_session
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => "/cable"

  scope "/player" do
    get "now_playing", to: "player#now_playing"
    put "play", to: "player#play"
    put "pause", to: "player#pause"
    put "next", to: "player#next"
    put "previous", to: "player#previous"
  end
end
