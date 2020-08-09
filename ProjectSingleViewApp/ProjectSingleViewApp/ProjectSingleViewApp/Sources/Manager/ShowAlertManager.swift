import UIKit

class ShowAlertManager {
    static func show(title: String, message: String, target: UIViewController) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))

        target.present(alert, animated: true)
    }
}
