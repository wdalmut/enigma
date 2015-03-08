describe "Different rotor types", ->
  it "should rotate on every key press", ->
    rotor = new Rotor("I", 0)
    expect(rotor.map("a")).toBe("j")
    expect(rotor.map("a")).toBe("c")
    expect(rotor.map("a")).toBe("r")

    rotor = new Rotor("I", 0)
    expect(rotor.map("b")).toBe("e")
    expect(rotor.map("b")).toBe("j")
    expect(rotor.map("b")).toBe("c")

