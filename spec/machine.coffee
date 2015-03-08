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
        new Plugboard,
        new Reflector("b"),
        new Rotor("III"),
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

  describe "Enigma is blind with a fake reflector", ->
    beforeEach ->
      machine = new Machine
      machine.compose [
        new Plugboard,
        new Reflector("fake"),
        new Rotor("III"),
        new Rotor("II"),
        new Rotor("I"),
      ]

      @machine = machine

    it "should scramble hello world as hello world", ->
      expect(@machine.scramble "helloworld").toBe "helloworld"

  describe "Rotors are moved during typing", ->
    rotor = null

    beforeEach ->
      @rotora = new Rotor("III")
      spyOn @rotora, "revolution"
      @rotorb = new Rotor("III")
      spyOn @rotorb, "revolution"
      @rotorc = new Rotor("III")
      spyOn @rotorc, "revolution"

      machine = new Machine
      machine.compose [
        new Plugboard,
        new Reflector("fake"),
        @rotora
        @rotorb
        @rotorc
      ]

      @machine = machine

    it "should move first rotor continuously", ->
      @machine.scramble "helloworld"

      expect(@rotora.revolution).toHaveBeenCalled()
      expect(@rotora.revolution.calls.count()).toEqual(10)

      expect(@rotorb.revolution).not.toHaveBeenCalled()
      expect(@rotorc.revolution).not.toHaveBeenCalled()

    it "should move second rotor one every 26 characters", ->
      @machine.scramble "abcdefghijklmnopqrstuvwxyza"

      expect(@rotora.revolution).toHaveBeenCalled()
      expect(@rotora.revolution.calls.count()).toEqual(27)

      expect(@rotorb.revolution).toHaveBeenCalled()
      expect(@rotorb.revolution.calls.count()).toEqual(1)

      expect(@rotorc.revolution).not.toHaveBeenCalled()

    it "should move third rotor one every 676 characters", ->
      for l in [0..25]
        @machine.scramble "abcdefghijklmnopqrstuvwxyz"

      expect(@rotora.revolution).toHaveBeenCalled()
      expect(@rotorb.revolution).toHaveBeenCalled()
      expect(@rotorc.revolution).toHaveBeenCalled()
      expect(@rotorc.revolution.calls.count()).toEqual(1)

  describe "Try a cipher different sentences", ->
    beforeEach ->
      machine = new Machine
      machine.compose [
        new Plugboard,
        new Reflector("b"),
        new Rotor("III"),
        new Rotor("II"),
        new Rotor("I"),
      ]

      @machine = machine

    it "should scramble hello world", ->
      expect(@machine.scramble "helloworld").toBe "zpezrrcuwj"

    it "should scramble 'zpezrrcuwj' back to 'helloworld'", ->
      expect(@machine.scramble "zpezrrcuwj").toBe "helloworld"

    it "should scramble a long sentence", ->
      expect(@machine.scramble "helloworldhelloworldhelloworld").toBe "zpezrrcuwjiqtkionlxgexcatxznky"

    it "should scramble back a long sentence", ->
      expect(@machine.scramble "zpezrrcuwjiqtkionlxgexcatxznky").toBe "helloworldhelloworldhelloworld"

  describe "Scramble with a different default configurations", ->
    beforeEach ->
      machine = new Machine
      machine.compose [
        new Plugboard([
          {'a': 'd'},
          {'b': 'e'},
          {'h': 'k'},
        ]),
        new Reflector("b"),
        new Rotor("III", 23),
        new Rotor("II", 12),
        new Rotor("I", 11),
      ]

      @machine = machine

    it "should scramble hello world", ->
      expect(@machine.scramble "helloworld").toBe "xhckeehbxf"

    it "should scramble 'xhckeehbxf' back to 'helloworld'", ->
      expect(@machine.scramble "xhckeehbxf").toBe "helloworld"

    it "should scramble a long sentence", ->
      expect(@machine.scramble "helloworldhelloworldhelloworld").toBe "xhckeehbxftmfpxusdryvgzszjvovu"

    it "should scramble back a long sentence", ->
      expect(@machine.scramble "xhckeehbxftmfpxusdryvgzszjvovu").toBe "helloworldhelloworldhelloworld"

