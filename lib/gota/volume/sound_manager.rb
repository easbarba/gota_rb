# frozen_string_literal: true

# Sound manager information
module Gota
  module Volume
    # Find available sound manager
    class SoundManager
      attr_reader :utils, :state

      def initialize(utils, state)
        @utils = utils
        @state = state
      end

      def managers_available
        [Pactl.new(state), Amixer.new, Mixer.new]
      end

      # Sound Manager Information
      def info
        managers_available.first { |manager| utils.which?(manager.name) }
      end

      def running?
        raise 'not implemented.'
      end
    end
  end
end
