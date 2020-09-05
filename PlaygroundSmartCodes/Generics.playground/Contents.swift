import Foundation

///

// func funcName<Template>(item: Template) -> Template
func foo<B>(item: B) -> B {
    return item
}

foo(item: "Casa")
foo(item: 2)
foo(item: [2])

///

func bar<T>(item: T?) -> Bool {
    return item != nil
}

func bar2<T: NSObject>(item: T?) -> T {
    return item ?? T()
}

class MyType: NSObject { }

var myType: MyType? = nil

bar(item: "Casa")
bar(item: 2)
bar(item: [2])
bar(item: myType)

print(bar2(item: myType))

///

enum Result<S, E> where E: Error {

}

protocol MyProtocol {
    func foo()
}
extension String: MyProtocol {
    func foo() {
        print(self)
    }
}
extension Int: MyProtocol {
    func foo() {
        print(self)
    }
}

struct Person<T: Equatable & MyProtocol> {
    var model: T
}

let p1 = Person(model: "Felipe")
let p2 = Person(model: "Felipe")
let p3 = Person(model: 1999)

print(p1.model == p2.model)
p1.model.foo()
p3.model.foo()
