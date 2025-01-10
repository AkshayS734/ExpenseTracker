import UIKit

class BudgetViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var remainingTextField: UITextField!
    @IBOutlet weak var spentTextField: UITextField!
    @IBOutlet weak var sanctionedTextField: UITextField!
    var label: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let labelText = label {
            titleLabel.text = labelText
        } else {
            titleLabel.text = "Budget"
        }
        NotificationCenter.default.addObserver(self, selector: #selector(refreshBudgetData), name: .expenseUpdated, object: nil)
    }
    @objc func refreshBudgetData() {
        if let category = label {
            updateBudgetInfo(for: category)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .expenseUpdated, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let category = label {
            updateBudgetInfo(for: category)
        }
    }
    
    func updateBudgetInfo(for category: String) {
        if let budget = BudgetManager.shared.getBudget(for: category) {
            sanctionedTextField.text = String(format: "%.2f", budget.sanctioned)
            spentTextField.text = String(format: "%.2f", budget.spent)
            remainingTextField.text = String(format: "%.2f", budget.remaining)
        }
    }
}

