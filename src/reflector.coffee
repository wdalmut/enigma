class Reflector
  type: {
    "a": "ejmzalyxvbwfcrquontspikhgd",
    "b": "yruhqsldpxngokmiebfzcwvjat",
    "c": "fvpjiaoyedrzxwgctkuqsbnmhl",
    "fake": "abcdefghijklmnopqrstuvwxyz",
  }

  constructor: (model) ->
    @model = model

  map: (letter) ->
    pos = letter.charCodeAt 0
    this.type[this.model][pos % 97]

window.Reflector = Reflector

