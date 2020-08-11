import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = CoreAPIService()

        api.getCharacters { response in
            switch response {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }


    private func foo(bar: String) {
        print(bar)
    }
}



