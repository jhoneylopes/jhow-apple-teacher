import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!

    private var data: [CharactersResult]?
    private var filter: FilterCharacters = .name
    private let segueIdentifier = "FullImageScreenSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        mySearchBar.delegate = self
        self.title = self.filter.text

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
        api.getCharacters(name: name, filter: self.filter) { response in
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let vc = segue.destination as? FullImageViewController,
                let url = sender as? URL {
                vc.show(urlImage: url)
            }
        }
    }

    @IBAction func filterCells(_ sender: Any) {
        showFilterAlert()
    }

    private func showFilterAlert() {
        let alert = UIAlertController(title: "Escolha o seu filtro", message: "Filtros alteram o resultado. \nSe deseja algo específico, usar filtro por Nome. \nSe deseja vários resultados, filtre por palavra inicial.", preferredStyle: .alert)

        alert.addAction(UIAlertAction.init(title: "Nome", style: .default) { [weak self] action in
            guard let self = self else { return }
            self.filter = .name
            self.title = self.filter.text
            self.mySearchBar.placeholder = "Busca por nome"
        })
        alert.addAction(UIAlertAction(title: "Palavra Inicial", style: .default) { [weak self] action in
            self?.filter = .nameStartsWith
            self?.title = self?.filter.text
            self?.mySearchBar.placeholder = "Busca por palavra inicial"
        })

        self.present(alert, animated: true)
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

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = data?[indexPath.row] {
            let url = URL(string: "\(item.thumbnail.path).\(item.thumbnail.extension)")
            performSegue(withIdentifier: segueIdentifier, sender: url)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        getCharacters(with: searchBar.text)
    }
}
