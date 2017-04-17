require_relative "./spotify/player.rb"
require_relative "./spotify/monitor"

module Spotify
  # Private: The namespace for all instrumented events.
  InstrumentationNamespace = :spotify
end
