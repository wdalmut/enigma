class Rotor
  rotors: {
    "I": "ekmflgdqvzntowyhxuspaibrcj",
    "II": "ajdksiruxblhwtmcqgznpyfvoe",
    "III": "bdfhjlcprtxvznyeiwgakmusqo",
  }
  letters: false

  constructor: (type, position) ->
    @letters = @rotors[type]

    i=0
    while i < position
      this.revolution()
      i++

  map: (letter) ->
    @letters[(letter.charCodeAt 0) - 97]

  revolution: () ->
    @letters = (@letters[25..] + @letters)[0..25]


window.Rotor = Rotor
