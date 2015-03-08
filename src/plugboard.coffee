class Plugboard
  wirings: {
    "a": "a",
    "b": "b",
    "c": "c",
    "d": "d",
    "e": "e",
    "f": "f",
    "g": "g",
    "h": "h",
    "i": "i",
    "j": "j",
    "k": "k",
    "l": "l",
    "m": "m",
    "n": "n",
    "o": "o",
    "p": "p",
    "q": "q",
    "r": "r",
    "s": "s",
    "t": "t",
    "u": "u",
    "v": "v",
    "w": "w",
    "x": "x",
    "y": "y",
    "z": "z",
  }

  constructor: (maps = []) ->
    for map in maps
      for key, value of map
        this.wire key, value

  wire: (letter, to) ->
    this.wirings[letter] = to
    this.wirings[to] = letter

  map: (letter) ->
    this.wirings[letter]

window.Plugboard = Plugboard
