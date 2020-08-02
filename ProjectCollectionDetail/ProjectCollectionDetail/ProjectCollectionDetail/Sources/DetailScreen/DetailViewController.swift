import UIKit

protocol DetailViewControllerDelegate {
    func didFinishedSomeThing(from detail: String)
}

class DetailViewController: UIViewController {
    var model: PlanetModel?
    var delegate: DetailViewControllerDelegate?

    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var planetImage: UIImageView!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myAboutDetailViewControllerSegue" {
            if let detail = segue.destination as? AboutDetailViewController {
                detail.delegate = self
            }
        }
    }

    @IBAction func didTapAbouDetail(_ sender: Any) {
        performSegue(withIdentifier: "myAboutDetailViewControllerSegue", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false        
        if let safeModel = model {
            self.title = safeModel.title
            planetImage.image = safeModel.image
        }
        myCollection.dataSource = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

extension DetailViewController {
    func show(from model: PlanetModel) {        
        self.model = model
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.curiosity.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCuriosityCell", for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.curiosity.text = model?.curiosity[indexPath.row]

        return cell
    }
}

extension DetailViewController: AboutDetailViewControllerDelegate {
    func destroyPlanet() {
        planetImage.image = UIImage(named: "Wormhole")
        delegate?.didFinishedSomeThing(from: "Destroied The Planet")
    }
}
