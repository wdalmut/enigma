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

    letter = @plugboard.map letter
    letter = @rotors[0].map letter
    letter = @rotors[1].map letter
    letter = @rotors[2].map letter
    letter = @reflector.map letter
    letter = @rotors[2].unmap letter
    letter = @rotors[1].unmap letter
    letter = @rotors[0].unmap letter
    letter = @plugboard.map letter

    @rotors[0].revolution()
    if @iteration % 26 == 0 then @rotors[1].revolution()
    if @iteration % 676 == 0 then @rotors[2].revolution()

    letter

  scramble: (sentence) ->
    scrambled = ""
    for letter in sentence
      scrambled += @map letter

    scrambled

window.Machine=Machine
