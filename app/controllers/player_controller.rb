require "net/http"

class PlayerController < ApplicationController

  def show
    @song = player.now_playing
    id = (@song[:id] || "").split(":").last
    @preview = Rails.cache.fetch(id) do
      fetchez_la_preview(id)
    end
  end

  def now_playing
    @song = player.now_playing
  end

  def play
    player.play
    render json: "OK"
  end

  def pause
    player.pause
    render json: "OK"
  end

  def next
    player.play_next
    render json: "OK"
  end

  def previous
    player.play_previous
    render json: "OK"
  end

  protected

  def player
    Ffwd::Spotify::Player
  end

  # High chance of breaking
  def fetchez_la_preview(id)
    uri = URI.parse("https://api.spotify.com/v1/tracks/#{id}")
    JSON.parse(Net::HTTP.get(uri))["album"]["images"].first["url"]
  rescue
    nil
  end
end
