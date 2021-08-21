# frozen_string_literal: true

module Gota
  # Take a shot of the marvelous screen
  class Screenshot
    PREFERRED_FORMAT = 'png'
    SHOTTERS_FOLDER = Pathname.new(Dir.home).join('.config', 'gota', 'screenshot')
    FOLDER = Pathname.new(Dir.home).join('Pictures')
    CURRENT_TIME = Time.new.strftime '%d-%m-%y-%I-%M'

    attr_reader :utils, :mode

    def initialize(services, mode)
      @utils = services.resolve :utils
      @mode = mode.to_sym if mode
    end

    def shotters
      utils.parse_folder SHOTTERS_FOLDER
    end

    def shotters_available
      shotters.find_all do |shotter|
        sh = shotter[1]
        sh[:bin] if utils.which? sh[:bin]
      end
    end

    def shotter
      shotters_available.first[1]
    end

    def screenshot_name
      "screenshot-#{CURRENT_TIME}.#{PREFERRED_FORMAT}"
    end

    def final_command
      "#{shotter[:bin]} #{shotter[mode]} #{eval shotter[:folder]}"
    end

    def run
      return if %w[full partial].include? mode

      system final_command
    end
  end
end
