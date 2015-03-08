class Machine
  plugboard: false
  reflector: false
  rotors: []
  iteration: 0

  compose: (parts) ->
    @rotors = []
    iteration = 0

    for part in parts
      if part instanceof Reflector
        @reflector = part
      if part instanceof Plugboard
        @plugboard = part
      if part instanceof Rotor
        @rotors.push part

  map: (letter) ->
    ++@iteration

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
    if @iteration % 26 == 0 then @rotors[1].revolution()
    if @iteration % 676 == 0 then @rotors[2].revolution()

    letter

  scramble: (sentence) ->
    scrambled = ""
    for letter in sentence
      scrambled += this.map letter

    scrambled

window.Machine=Machine
