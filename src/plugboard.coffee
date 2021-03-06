class Plugboard
  constructor: (maps = []) ->
    @wirings = {
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

    for map in maps
      for key, value of map
        @wire key, value

  wire: (letter, to) ->
    @wirings[letter] = to
    @wirings[to] = letter

  map: (letter) ->
    @wirings[letter]

window.Plugboard = Plugboard
