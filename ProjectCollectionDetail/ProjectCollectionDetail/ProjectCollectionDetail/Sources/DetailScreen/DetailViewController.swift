import UIKit

class DetailViewController: UIViewController {
    var model: PlanetModel?
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var planetImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeModel = model {
            self.title = safeModel.title
            planetImage.image = safeModel.image
        }
        myCollection.dataSource = self
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
