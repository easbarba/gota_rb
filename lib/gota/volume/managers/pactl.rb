module Gota
  # Control commands to the PulseAudio sound server.
  class Pactl
    STEP = 3

    attr_accessor :name, :state

    def initialize(state)
      @name = 'pactl'
      @state = state
    end

    def sink
      `pactl list sinks`.split('Sink #').find do |sink|
        sink if sink.include? 'State: RUNNING'
      end[0] # sink id is the first letter in the string returned
    end

    def toggle
      "set-sink-mute #{sink} toggle"
    end

    def updown
      "set-sink-volume #{sink} #{state}#{STEP}%"
    end

    def to_s
      "#{name} #{sink} #{state}"
    end
  end
end
