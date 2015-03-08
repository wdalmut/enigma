describe "Several reflector models", ->
  it "should describe the model 'a' type", ->
    reflector = new Reflector("a")
    expect(reflector.map("a")).toBe("e")
    expect(reflector.map("b")).toBe("j")
    expect(reflector.map("z")).toBe("d")

  it "should describe the model b type", ->
    reflector = new Reflector("b")
    expect(reflector.map("a")).toBe("y")
    expect(reflector.map("b")).toBe("r")
    expect(reflector.map("z")).toBe("t")

  it "should describe the model c type", ->
    reflector = new Reflector("c")
    expect(reflector.map("a")).toBe("f")
    expect(reflector.map("b")).toBe("v")
    expect(reflector.map("z")).toBe("l")
