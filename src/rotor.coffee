class Rotor
  rotors: {
    "I": "ekmflgdqvzntowyhxuspaibrcj",
    "II": "ajdksiruxblhwtmcqgznpyfvoe",
    "III": "bdfhjlcprtxvznyeiwgakmusqo",
  }
  letters: false

  constructor: (type, position) ->
    @letters = @rotors[type]
    @iteration = position

  map: (letter) ->
    letters = this.moveLettersTo()
    letters[(letter.charCodeAt 0) - 97]

  moveLettersTo: ->
    @letters = (@letters[25..] + @letters)[0..25]


window.Rotor = Rotor
