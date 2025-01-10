import UIKit

class BalanceTabViewController: UIViewController {
    @IBOutlet weak var sbiTextField: UITextField!
    @IBOutlet weak var bobTextField: UITextField!
    @IBOutlet weak var hdfcTextField: UITextField!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBalanceTextFields()
    }
    override func viewDidAppear(_ animated: Bool) {
        count += 1
        print("Balance Tab opened \(count) times")
    }
    
    func updateBalanceTextFields() {
        sbiTextField.text = String(format: "%.2f", AccountManager.shared.getAccountBalance(for: 0) ?? 0)
        bobTextField.text = String(format: "%.2f", AccountManager.shared.getAccountBalance(for: 1) ?? 0)
        hdfcTextField.text = String(format: "%.2f", AccountManager.shared.getAccountBalance(for: 2) ?? 0)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBalanceTextFields()
    }

}
