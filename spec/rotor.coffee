describe "Different rotor types", ->
  it "should map always the same letter when no revolution are made", ->
    rotor = new Rotor("I", 0)
    expect(rotor.map("a")).toBe("e")
    expect(rotor.unmap("e")).toBe("a")

