import UIKit

protocol AboutDetailViewControllerDelegate {
    func destroyPlanet()
}

class AboutDetailViewController: UIViewController{
    var delegate: AboutDetailViewControllerDelegate?

    @IBAction func didTapDestroyPlanet(_ sender: Any) {
        delegate?.destroyPlanet()
    }
}
