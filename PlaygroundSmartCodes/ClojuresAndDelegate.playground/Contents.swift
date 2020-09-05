import UIKit

// Closures are self-contained blocks of functionality that can be passed around and used in your code.

let a = { (response: Int) -> Int in
    return response
}
a(99)

let b: (Int) -> Int = { response in
    response
}
b(1999)

let c: (Int, Int, Int) -> Int = { $0 * $1 * $2 }
c(1, 2, 3)

let d: ((Int) -> Int)?
d = b
d?(1998)


///

class View: UIView {
    var customTitle: ((String) -> Void)? // () -> () Clojure

    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)

        self.bind()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bind() {
        customTitle = { title in
            self.titleLabel.text = title
        }
    }
}

class ViewModel {
    let myView: View

    init() {
        myView = View(frame: CGRect(x: 0, y: 0, width: 100, height: 500))
    }

    func show(title: String) {
        myView.customTitle?(title)
    }
}

let myViewModel = ViewModel()
myViewModel.myView
myViewModel.show(title: "My Title")
myViewModel.myView

myViewModel.myView.titleLabel.bounds
print(myViewModel.myView.titleLabel.bounds)
print(myViewModel.myView.titleLabel.frame)

