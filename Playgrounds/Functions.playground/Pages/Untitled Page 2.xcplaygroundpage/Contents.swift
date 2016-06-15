func hello(peopleNamed people: String...) {
    if people.isEmpty {
        hello(peopleNamed: "World")
    }
    for person in people {
        print("Hello, \(person)!")
    }
}
hello(peopleNamed: "Swift Programmer", "Swift 2 Developer")
hello()
