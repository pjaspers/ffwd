class PlayerController < ApplicationController

  def show
    @song = player.now_playing
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
end
