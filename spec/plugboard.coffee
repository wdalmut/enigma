describe "Plugboard", ->

  it "should use a default letters mapping", ->
    plugboard = new Plugboard
    expect(plugboard.wire("a")).toBe("a")

  it "should remap an existing letter to another one", ->
    plugboard = new Plugboard
    plugboard.map("a", "b")

    expect(plugboard.wire "a").toBe("b")
