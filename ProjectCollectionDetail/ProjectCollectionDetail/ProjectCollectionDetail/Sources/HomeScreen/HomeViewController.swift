import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var myCollection: UICollectionView!

    private var data: [String] = [
        "Mercúrio", "Vênus", "Terra",
        "Marte", "Júpiter", "Saturno",
        "Urano", "Netuno"
    ]

    // MARK: - Init

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Planetas"
        // Setups | Configurations
        myCollection.dataSource = self
        myCollection.delegate = self

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Animations
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myDetailViewControllerSegue" {
            guard let indexPath = sender as? IndexPath else { return }
            if let detail = segue.destination as? DetailViewController {
                detail.title = data[indexPath.row]
            }
        }
    }
}

// MARK: - Collection Data Source
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.myPlanetImage.image = UIImage(named: "Merc")

        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "myDetailViewControllerSegue", sender: indexPath)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let screen = UIScreen.main.bounds
        return CGSize(width: screen.size.width/2.0, height: 200.0)
    }
}
