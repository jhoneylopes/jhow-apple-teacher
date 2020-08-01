import UIKit

struct PlanetModel {
    let title: String
    let curiosity: [String]
    let imageName: String
}

extension PlanetModel {
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
