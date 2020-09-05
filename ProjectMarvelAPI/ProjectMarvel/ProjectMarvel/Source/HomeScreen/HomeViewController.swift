import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!

    var data: [CharactersResult]?

    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        mySearchBar.delegate = self
        
        callService()
    }

    private func callService() {
        getCharacters()

        let api = CoreAPIService()
        api.getComics { response in
            switch response {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }

    private func getCharacters(with name: String? = nil) {
        let api = CoreAPIService()
        api.getCharacters(name: name) { response in
            switch response {
            case .success(let response):
                self.data = response.data.results
                self.myTable.reloadData()

                print(self.data!)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersViewCell", for: indexPath) as? CharactersViewCell else {
            return .init()
        }
        if let item = data?[indexPath.row] {
            cell.characterName.text = item.name
            cell.descriptionView.text = item.description
            let url = URL(string: "\(item.thumbnail.path).\(item.thumbnail.extension)")            
            cell.characterImage.kf.setImage(with: url)
        }
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        getCharacters(with: searchBar.text)
    }
}
