class Machine
  plugboard: false
  reflector: false
  rotors: []

  compose: (parts) ->
    @rotors = []
    for part in parts
      if part instanceof Reflector
        @reflector = part
      if part instanceof Plugboard
        @plugboard = part
      if part instanceof Rotor
        @rotors.push part

  map: (letter) ->
    letter = this.plugboard.map letter
    letter = this.rotors[0].map letter
    letter = this.rotors[1].map letter
    letter = this.rotors[2].map letter
    letter = this.reflector.map letter
    letter = this.rotors[2].unmap letter
    letter = this.rotors[1].unmap letter
    letter = this.rotors[0].unmap letter
    letter = this.plugboard.map letter

    @rotors[0].revolution()

    letter

window.Machine=Machine
