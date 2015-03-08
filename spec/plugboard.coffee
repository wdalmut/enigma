describe "Plugboard", ->

  it "should use a default letters mapping", ->
    plugboard = new Plugboard
    expect(plugboard.wire("a")).toBe("a")

  it "should remap an existing letter to another one", ->
    plugboard = new Plugboard
    plugboard.map("a", "b")

    expect(plugboard.wire "a").toBe("b")
    expect(plugboard.wire "b").toBe("a")

  it "should remap different letters", ->
    plugboard = new Plugboard
    plugboard.map("a", "b")
    plugboard.map("c", "z")

    expect(plugboard.wire "a").toBe("b")
    expect(plugboard.wire "b").toBe("a")

    expect(plugboard.wire "c").toBe("z")
    expect(plugboard.wire "z").toBe("c")

