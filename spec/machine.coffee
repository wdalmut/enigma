describe "the whole enigma machine", ->
  it "should prepare all components", ->
    machine = new Machine
    machine.compose [
      new Reflector("fake"),
      new Plugboard,
      new Rotor("I"),
      new Rotor("II"),
      new Rotor("III")
    ]

    expect(machine.reflector instanceof Reflector).toBeTruthy()
    expect(machine.plugboard instanceof Plugboard).toBeTruthy()

    expect(machine.rotors[0] instanceof Rotor).toBeTruthy()
    expect(machine.rotors[1] instanceof Rotor).toBeTruthy()
    expect(machine.rotors[2] instanceof Rotor).toBeTruthy()

    expect(machine.rotors[0].letters).toBe("ekmflgdqvzntowyhxuspaibrcj")
    expect(machine.rotors[1].letters).toBe("ajdksiruxblhwtmcqgznpyfvoe")
    expect(machine.rotors[2].letters).toBe("bdfhjlcprtxvznyeiwgakmusqo")

  describe "the standard enigma machine", ->

    beforeEach ->
      machine = new Machine
      machine.compose [
        new Reflector("b"),
        new Plugboard,
        new Rotor("III")
        new Rotor("II"),
        new Rotor("I"),
      ]

      @machine = machine

    it "should map one way a single char", ->
      expect(@machine.map "e").toBe "b"

    it "should map back a single char", ->
      expect(@machine.map "b").toBe "e"

    it "should map multiple characters one way", ->
      expect(@machine.map "e").toBe "b"
      expect(@machine.map "e").toBe "p"

    it "should map multiple characters back to original", ->
      expect(@machine.map "b").toBe "e"
      expect(@machine.map "p").toBe "e"


