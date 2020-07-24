// Func
func hello(_ text: String, completion: (String) -> Bool) -> Bool {
    func world() -> Bool {
        return completion(text)
    }

    return world()
}

///

// Initializing a Clojure/Closure
let comp: (String) -> Bool = { (text: String) -> Bool in
    print(text)
    return text.isEmpty
}

///

print(hello("", completion: comp))
//
// true

print(hello("Hello World!", completion: comp))
// Hello World!
// false
