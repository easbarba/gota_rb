# frozen_string_literal: true

module Gota
  # Manage System backlight.
  class Backlight
    STEP = 5

    attr_reader :state

    def initialize(state)
      @state = state.to_sym
    end

    def brighter
      'brightnessctl'
    end

    def actions
      {
        up: "set #{STEP}%+",
        down: "set #{STEP}%-"
      }
    end

    def final_command
      "#{brighter} #{actions[state]}"
    end

    def run
      return if %w[up down].include? state

      system final_command
    end
  end
end
