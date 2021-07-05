#!/usr/bin/env ruby

# frozen_string_literal: true

# Manage System Volume.
module Gota
  module Volume
    # Volume Main caller
    class Main
      attr_reader :state, :manager
      attr_accessor :info

      def initialize(services, state)
        @state = state.to_sym if state

        utils = services.resolve :utils
        @manager = SoundManager.new(utils, states[@state]).info
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
        manager.toggle
      end

      def updown
        manager.updown
      end

      def mode
        {
          toggle: toggle,
          up: updown,
          down: updown
        }
      end

      def final_command
        p "#{manager.name} #{mode[state]}"
      end

      def run
        return unless %i[up down toggle].include? state

        system final_command
      end
    end
  end
end
