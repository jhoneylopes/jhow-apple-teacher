import UIKit

protocol AboutDetailViewControllerDelegate: class {
    func destroyPlanet()
}

class AboutDetailViewController: UIViewController{
    weak var delegate: AboutDetailViewControllerDelegate?

    @IBAction func didTapDestroyPlanet(_ sender: Any) {
        delegate?.destroyPlanet()
    }
}
