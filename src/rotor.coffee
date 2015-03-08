class Rotor
  availableRotors: {
    "I":   "ekmflgdqvzntowyhxuspaibrcj",
    "II":  "ajdksiruxblhwtmcqgznpyfvoe",
    "III": "bdfhjlcprtxvznyeiwgakmusqo",
  }
  letters: false

  constructor: (type, position) ->
    @letters = @availableRotors[type]

    i=0
    while i < position
      this.revolution()
      i++

  map: (letter) ->
    pos = (letter.charCodeAt 0) - 97
    @letters[pos]

  unmap: (letter) ->
    pos = @letters.indexOf letter
    char = String.fromCharCode(97 + pos)

  revolution: () ->
    @letters = (@letters[25..] + @letters)[0..25]


window.Rotor = Rotor
