import UIKit
import Kingfisher

class FullImageViewController: UIViewController {
    @IBOutlet weak var myFullImage: UIImageView!
    @IBOutlet weak var myLoadingView: UIView!
    private var urlImage: URL?


    override func viewDidLoad() {
        super.viewDidLoad()
        myLoadingView.isHidden = false
        myFullImage.kf.setImage(with: urlImage) { [weak self] response in
            switch response {
            case .success:
                self?.myLoadingView.isHidden = true
            case .failure(let error):
                print(error)
            }
        }
    }

    func show(urlImage: URL) {
        self.urlImage = urlImage
    }

    @IBAction func shareAction(_ sender: Any) {
        let items: [UIImage] = [myFullImage.image ?? UIImage()]
        let ac = UIActivityViewController(activityItems: items,
                                          applicationActivities: nil)

        present(ac, animated: true)
    }
}
