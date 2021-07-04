#!/usr/bin/env ruby

# frozen_string_literal: true

# Manage System Volume.
module Gota
  module Volume
    class main
      STEP = 3

      attr_reader :state
      attr_accessor :info

      def initialize(state)
        @state = state.to_sym if state
        @info = SoundManager.new.info
      end

      def states
        {
          up: '+',
          down: '-',
          toggle: ''
        }
      end

      # * MODES

      def toggle
        {
          pactl: pactl_toggle,
          amixer: amixer_toggle,
          mixer: mixer_toggle
        }
      end

      def updown
        {
          pactl: pactl_updown,
          amixer: amixer_updown,
          mixer: mixer_updown
        }
      end

      def mode
        {
          toggle: toggle[info.name],
          up: updown[info.name],
          down: updown[info.name]
        }
      end

      def final_command
        mode[state]
      end

      def run
        return unless %i[up down toggle].include? state

        system final_command
      end
    end
  end
end

# * SOUND MANAGERS

def sound_managers
  %w[pactl amixer mixer]
end

def sound_manager
  sound_managers.first { |manager| utils.which?(manager) }.to_sym
end

# * ARGUMENTS
# * RUN
