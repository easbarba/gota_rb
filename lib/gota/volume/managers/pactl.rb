module Gota
  # s
  class Pactl
    def pactl
      {
        name: 'pactl',
        toggle: "set-sink-mute #{info.sink} toggle",
        updown: "set-sink-volume #{info.sink} #{states[state]}#{STEP}%"
      }
    end

    def pactl_toggle
      [pactl[:name], pactl[:toggle]].join(' ')
    end

    def pactl_updown
      [pactl[:name], pactl[:updown]].join(' ')
    end
  end
end

