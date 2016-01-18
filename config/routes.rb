Rails.application.routes.draw do
  root to: "player#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  scope "/player" do
    get 'now_playing', to: "player#now_playing"
    put 'play', to: "player#play"
    put 'pause', to: "player#pause"
    put 'next', to: "player#next"
    put 'previous', to: "player#previous"
  end
end
