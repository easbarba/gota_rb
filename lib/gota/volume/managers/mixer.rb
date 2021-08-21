# frozen_string_literal: true

module Gota
  # BSD MIXER
  class Mixer
    def mixer
      {
        name: 'mixer',
        toggle: '',
        updown: "mixer vol #{states[state]}#{STEP}"
      }
    end

    def mixer_toggle
      [mixer[:name], mixer[:toggle]].join(' ')
    end

    def mixer_updown
      [mixer[:name], mixer[:updown]].join(' ')
    end
  end
end
