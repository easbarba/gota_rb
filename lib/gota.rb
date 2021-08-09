# frozen_string_literal: true

require_relative 'gota/version'

# * Main
require_relative 'gota/backlight'
require_relative 'gota/dots'
require_relative 'gota/homey'

# * Screenshot
require_relative 'gota/screenshot'

# * Volume
require_relative 'gota/volume/main'
require_relative 'gota/volume/sound_manager'
require_relative 'gota/volume/managers/pactl'
require_relative 'gota/volume/managers/mixer'
require_relative 'gota/volume/managers/amixer'

# * Services
require_relative 'gota/services/utils'
require_relative 'gota/services/folders'
