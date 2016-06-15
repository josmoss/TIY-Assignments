func hello(names: String...) -> (count: Int, peopleList: String) {
    return (names.count, names.reduce("Hello,"){$0 + "\n" + $1})
}

hello("Swift Programmer", "Obj-C Old-timer").count
hello("Swift Programmer", "Obj-C Old-timer").peopleList
