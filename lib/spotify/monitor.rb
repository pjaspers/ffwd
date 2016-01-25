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
    # Private: The name of feature instrumentation events.
    InstrumentationName = "monitor_operation.spotify"

    attr_accessor :interval
    attr_accessor :running
    attr_accessor :state

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
      # Swallow, because we want to keep listening
    end

    def process_reading(sample)
      self.state = sample.state
      on_started.call(sample.data) if sample.starting?
      on_playing.call(sample.data) if sample.playing?
      on_ending.call(sample.data) if sample.ending?
    end

    def on_started(&block)
      @on_started ||= operation("starting", &block)
    end

    def on_playing(&block)
      @on_ending ||= operation("playing", &block)
    end

    def on_ending(&block)
      @on_ending ||= operation("ending", &block)
    end

    def player
      Ffwd::Spotify::Player
    end

    private

    def operation(name, &block)
      proc do |song_data|
        instrument(name) do |payload|
          payload[:name] = song_data[:name]
          payload[:thing] = song_data
          block.call(song_data)
        end
      end
    end

    def instrument(operation)
      @instrumenter ||= ActiveSupport::Notifications
      @instrumenter.instrument(InstrumentationName) { |payload|
        payload[:operation] = operation
        payload[:result] = yield(payload) if block_given?
      }
    end
  end
end
