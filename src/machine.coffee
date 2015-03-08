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
    for rotor, i in @rotors
      letter = @rotors[i].map letter
    letter = @reflector.map letter
    for rotor, i in @rotors by -1
      letter = @rotors[i].unmap letter
    letter = @plugboard.map letter

    @rotors[0].revolution()
    for rotor, i in @rotors[1..]
      if @iteration % (Math.pow 26, i+1) == 0 then @rotors[i+1].revolution()

    letter

  scramble: (sentence) ->
    scrambled = ""
    for letter in sentence
      scrambled += @map letter

    scrambled

window.Machine=Machine
