module Gota
  # as
  class Amixer
    def amixer
      {
        name: 'amixer',
        toggle: '-q sset Master toggle',
        updown: "set Master #{STEP}%#{states[state]}"
      }
    end

    def amixer_toggle
      [amixer[:name], amixer[:toggle]].join(' ')
    end

    def amixer_updown
      [amixer[:name], amixer[:updown]].join(' ')
    end
  end
end
