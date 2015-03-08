# Enigma Machine [![Build Status](https://travis-ci.org/wdalmut/enigma.svg?branch=master)](https://travis-ci.org/wdalmut/enigma)

Just an Enigma machine in coffeescript (a kata)

```coffee
machine = new Machine
machine.compose [
  new Plugboard,
  new Reflector("b"),
  new Rotor("III")
  new Rotor("II"),
  new Rotor("I"),
]
```

## Scramble sentences

```coffee
# Scramble a text
machine.scramble "helloworld" # will echo 'zpezrrcuwj'
```

```coffee
# Restore the machine with initial setup
machine.scramble "zpezrrcuwj" # will echo 'helloworld'
```

## Plugboard

The plugboard is customizable. You can remap letters with:

```coffee
plugboard = new Plugboard [{'a': 'c'}, {'b': 'd'}]
```

## Reflectors

You can select different reflectors

```coffee
reflector = new Reflector "a"
reflector = new Reflector "b"
reflector = new Reflector "c"
```

You can also reflect the faker

```coffee
reflector = new Reflector "fake"
```

During the "fake" the reflector is one-to-one and no one character is scrambled.

## Rotors

You can mount rotors in different ways and you can start each of them at
different positions

```coffee
machine = new Machine
machine.compose [
  new Plugboard,
  new Reflector("b"),
  new Rotor("III", 10)
  new Rotor("I", 19),
  new Rotor("II", 7),
]
```

## Supports multiple rotors

You can mount different rotors (more than three).

```coffee

machine = new Machine
machine.compose [
  new Plugboard,
  new Reflector("b"),
  new Rotor("III", 10)
  new Rotor("I", 19),
  new Rotor("IV", 17)
  new Rotor("II", 7),
]
```

