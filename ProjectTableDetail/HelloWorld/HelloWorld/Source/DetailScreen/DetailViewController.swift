import UIKit

class DetailViewController: UIViewController {
    var planet: Planet?

    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetTitle: UILabel!
    @IBOutlet weak var planetNumberOfMoons: UILabel!
    @IBOutlet weak var descriptionView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let safePlanet = planet {
            planetTitle.text = safePlanet.name
            planetNumberOfMoons.text = String(describing: safePlanet.numberOfMoons)
            planetImageView.image = UIImage(named: safePlanet.imageURL)
            descriptionView.text = safePlanet.description
            title = safePlanet.name
        }
    }

    @IBAction func shareButton(_ sender: Any) {
        if let safePlanet = planet, let image = UIImage(named: safePlanet.imageURL) {
            let items: [UIImage] = [image]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
        } else {
            print("There is no image to share!")
        }
    }

}

extension DetailViewController {
    func show(with model: Planet) {
        self.planet = model
    }
}
