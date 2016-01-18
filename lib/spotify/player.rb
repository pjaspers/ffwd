require_relative "./../applescript"

module Ffwd
  module Spotify
    class Player
      # The application we're using. Spotify.
      #
      # Returns an Appscript instance of the music app.
      def self.tell_spotify(command)
        Ffwd::Applescript.run { 'tell application "%s" to %s' % ["spotify", command] }
      end

      # All songs in the library.
      def self.library
        []
      end

      # Play the music.
      def self.play
        tell_spotify("play")
      end

      # Pause the music.
      def self.pause
        tell_spotify("pause")
      end

      # Is there music currently playing?
      def self.paused?
        state = tell_spotify("get player state")
        state == :paused
      end

      # Play the next song.
      #
      # Returns the new song.
      def self.play_next
        tell_spotify("next track")
        now_playing
      end

      # Play the previous song.
      def self.play_previous
        tell_spotify("previous track")
      end

      # Get the current numeric volume.
      #
      # Returns an Integer from 0-100.
      def self.system_volume
        Tell_Spotifylescript.run('get output volume of (get volume settings)').chomp.to_i
      end

      # Set the system volume.
      #
      # setting - An Integer value between 0-100, where 100% is loud and, well, 0
      #           is for losers in offices that are boring.
      #
      # Returns the current volume setting.
      def self.system_volume=(setting)
        Tell_Spotifylescript.run('set volume output volume #{setting}')
        setting
      end

      # Get the current numeric volume.
      #
      # Returns an Integer from 0-100.
      def self.tell_spotify_volume
        tell_spotify("get sound volume")
      end

      # Set the tell_spotify volume.
      #
      # setting - An Integer value between 0-100, where 100% is loud and, well, 0
      #           is for losers in offices that are boring.
      #
      # Returns the current volume setting.
      def self.tell_spotify_volume=(setting)
        tell_spotify("set sound volume to #{setting}")
        setting
      end

      # Say something. Robots can speak too, you know.
      #
      # Thirds the volume, does its thing, brings the volume up again, and
      # returns the current volume.
      def self.say(message)
        previous = self.tell_spotify_volume
        self.tell_spotify_volume = self.tell_spotify_volume/3
        `say #{message}`
        self.tell_spotify_volume = previous
      end

      # Currently-playing song.
      #
      # Returns a Song.
      def self.now_playing
        options = {
          :id => tell_spotify("get id of current track"),
          :name => tell_spotify("get name of current track"),
          :artist => tell_spotify("get artist of current track"),
          :album => tell_spotify("get album of current track"),
          :duration => tell_spotify("get duration of current_track")
        }
      end
    end
  end
end
