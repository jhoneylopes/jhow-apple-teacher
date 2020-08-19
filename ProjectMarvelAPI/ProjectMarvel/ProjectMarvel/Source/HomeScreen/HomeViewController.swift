import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    var data: [CharactersResult]?

    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        callService()
    }

    private func callService() {
        let api = CoreAPIService()
        api.getCharacters { response in
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
        let cell = UITableViewCell()
        cell.textLabel?.text = data?[indexPath.row].name        
        return cell
    }
}

