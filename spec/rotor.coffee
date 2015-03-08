describe "Different rotor types", ->
  it "should map always the same letter when no revolution are made", ->
    rotor = new Rotor("I", 0)
    expect(rotor.map("a")).toBe("e")
    expect(rotor.map("a")).toBe("e")
    expect(rotor.map("a")).toBe("e")
    expect(rotor.map("a")).toBe("e")

  it "should rotate on every key press", ->
    rotor = new Rotor("I", 0)
    rotor.revolution()
    expect(rotor.map("a")).toBe("j")
    rotor.revolution()
    expect(rotor.map("a")).toBe("c")
    rotor.revolution()
    expect(rotor.map("a")).toBe("r")

    rotor = new Rotor("I", 0)
    rotor.revolution()
    expect(rotor.map("b")).toBe("e")
    rotor.revolution()
    expect(rotor.map("b")).toBe("j")
    rotor.revolution()
    expect(rotor.map("b")).toBe("c")

  it "should allows different inital positions", ->
    rotor = new Rotor("I", 10)
    expect(rotor.map("a")).toBe("x")
    rotor.revolution()
    expect(rotor.map("a")).toBe("h")

  it "should allows different rotor types", ->
    rotor = new Rotor("I", 0)
    rotor.revolution()
    expect(rotor.map("a")).toBe("j")

    rotor = new Rotor("II", 0)
    rotor.revolution()
    expect(rotor.map("a")).toBe("e")

    rotor = new Rotor("III", 0)
    rotor.revolution()
    expect(rotor.map("a")).toBe("o")

