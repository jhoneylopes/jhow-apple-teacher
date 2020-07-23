import UIKit

class DetailViewController: UIViewController {
    var planet: Planet?

    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetTitle: UILabel!
    @IBOutlet weak var planetNumberOfMoons: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let safePlanet = planet {
            planetTitle.text = safePlanet.name
            planetNumberOfMoons.text = String(describing: safePlanet.numberOfMoons)
        }
    }
}

extension DetailViewController {
    func show(with model: Planet) {
        self.planet = model
    }
}
