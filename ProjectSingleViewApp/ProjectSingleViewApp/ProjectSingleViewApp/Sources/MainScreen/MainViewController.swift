import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var executeButton: UIButton!

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var bmiResultLabel: UILabel!

    private var weight: Double = 0.0
    private var size: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        self.title = "Minha Saúde"
        configViews()
    }

    private func configViews() {
        executeButton.layer.cornerRadius = 6.0
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapBackground)
        )
        myScrollView.addGestureRecognizer(tap)
        bmiResultLabel.isHidden = true

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    @objc
    func didTapBackground(_ sender: Any) {
        self.view.endEditing(true)
    }

    @IBAction func calculateBMI(_ sender: Any) {
        let sWeight = weightTextField.text
        let sSize = sizeTextField.text
        calculateBMI(sWeight: sWeight, sSize: sSize)
    }

    @discardableResult func calculateBMI(sWeight: String?, sSize: String?) -> Bool {
        if let dWeight = Double(sWeight?.replacingOccurrences(of: ",", with: ".") ?? "0"),
            let dSize = Double(sSize?.replacingOccurrences(of: ",", with: ".") ?? "0") {
            if dSize > 0 {
                bmiResultLabel.text = String(format: "%.2f", dWeight / (dSize * dSize))
                bmiResultLabel.isHidden = false
                return true
            }
            return false
        } else {
            ShowAlertManager.show(title: "Erro",
                                  message: "Campos inválidos, por favor preencha os campos de peso e altura.",
                                  target: self)
            return false
        }
    }

    @IBAction func didTapInformationButton(_ sender: Any) {
        ShowAlertManager.show(title: "Informação",
                              message: "O seu IMC é calculado a partir da sua altura e o seu peso.",
                              target: self)
    }    
}
