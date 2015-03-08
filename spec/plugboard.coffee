describe "Plugboard", ->

  it "should use a default letters mapping", ->
    plugboard = new Plugboard
    expect(plugboard.map "a").toBe("a")

  it "should remap an existing letter to another one", ->
    plugboard = new Plugboard
    plugboard.wire("a", "b")

    expect(plugboard.map "a").toBe("b")
    expect(plugboard.map "b").toBe("a")

  it "should remap different letters", ->
    plugboard = new Plugboard
    plugboard.wire("a", "b")
    plugboard.wire("c", "z")

    expect(plugboard.map "a").toBe("b")
    expect(plugboard.map "b").toBe("a")

    expect(plugboard.map "c").toBe("z")
    expect(plugboard.map "z").toBe("c")

  it "should remap during construction", ->
    plugboard = new Plugboard([{"a":"b"},{"c": "d"}])

    expect(plugboard.map "a").toBe("b")
    expect(plugboard.map "b").toBe("a")

    expect(plugboard.map "c").toBe("d")
    expect(plugboard.map "d").toBe("c")

