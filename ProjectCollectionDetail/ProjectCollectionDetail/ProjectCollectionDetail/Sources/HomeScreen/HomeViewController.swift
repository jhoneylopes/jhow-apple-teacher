import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var myCollection: UICollectionView!

    private var data: [PlanetModel] = PlanetFactory.createPlanet()    

    // MARK: - Init
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
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
                detail.show(from: data[indexPath.row])
                detail.delegate = self                
            }
        }
    }

    @IBAction func didTapAbout(_ sender: Any) {
        performSegue(withIdentifier: "aboutViewControllerSegue", sender: sender)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

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

extension HomeViewController: DetailViewControllerDelegate {
    func didFinishedSomeThing(from detail: String) {
        print("Home: \(detail)")
    }
}
