import UIKit

class ListTableViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!

    private let data: [String] = ["Mercúrio", "Vênus", "Terra", "Marte", "Júpiter", "Saturno", "Urano", "Netuno"]

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    // Default function to use segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueDetailViewController" {
            guard let indexPath = sender as? IndexPath else { return }

            if let detail = segue.destination as? DetailViewController {
                detail.title = data[indexPath.row]
            }
        }
    }
}

// MARK: - TableViewDataSource
extension ListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

// MARK: - TableViewDelegate
extension ListTableViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt: IndexPath) {
        performSegue(withIdentifier: "SegueDetailViewController", sender: didSelectRowAt)
    }
}
