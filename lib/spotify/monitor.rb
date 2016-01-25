module Spotify
  class Sample
    STARTING = "starting"
    PLAYING = "playing"
    ENDING = "ending"

    attr_accessor :data

    def initialize(sample_data)
      @data = sample_data
    end

    def state
      return "#{STARTING}-#{data[:id]}" if starting?
      return "#{ENDING}-#{data[:id]}" if ending?
      "#{PLAYING}-#{data[:id]}"
    end

    def starting?
      data[:position] < 10
    end

    def playing?
      !starting? && !ending?
    end

    def ending?
      remaining = data[:duration] - data[:position]
      remaining < 10
    end

  end

  class Monitor

    attr_accessor :interval
    attr_accessor :running
    attr_accessor :state
    attr_accessor :logger

    def initialize(*)
      @interval = 1
      @running = false
    end

    def stop_listening!
      @running = false
    end

    def start_listening!
      self.running = true
      listen
    end

    def listen
      while running
        poll_spotify
        sleep interval
      end
    end

    def poll_spotify
      sample = Sample.new player.now_playing
      process_reading(sample) if sample.state != state
    rescue StandardError => e
      logger.error(e)
      # Swallow, because we want to keep listening
    end

    def process_reading(sample)
      self.state = sample.state
      logger.info state
      on_started.call(sample.data) if sample.starting?
      on_playing.call(sample.data) if sample.playing?
      on_ending.call(sample.data) if sample.ending?
    end

    def on_started
      @on_started ||= proc {}
      @on_started = proc { |song_data| yield(song_data) } if block_given?
      @on_started
    end

    def on_playing
      @on_playing ||= proc {}
      @on_playing = proc { |song_data| yield(song_data) } if block_given?
      @on_playing
    end

    def on_ending
      @on_ending ||= proc {}
      @on_ending = proc { |song_data| yield(song_data) } if block_given?
      @on_ending
    end

    def player
      Ffwd::Spotify::Player
    end

    def logger
      @logger ||= Rails.logger
    end

  end
end
