import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var bankAccountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        _ = descriptionTextField.text ?? ""
        guard let amountText = amountTextField.text, let amount = Double(amountText), amount > 0 else {
            showAlert(title: "Validation Error", message: "Please enter a valid amount.")
            return
        }
        
        let selectedCategoryIndex = categorySegmentedControl.selectedSegmentIndex

        switch categorySegmentedControl.selectedSegmentIndex{
        case 0:
            Expense.shared.educationExpense += amount
        case 1:
            Expense.shared.healthcareExpense += amount
        case 2:
            Expense.shared.travelExpense += amount
        case 3:
            Expense.shared.foodExpense += amount
        case 4:
            Expense.shared.rentExpense += amount
        default:
            break
        }
        let categories = ["Education", "Healthcare", "Travel", "Food", "Rent"]
        guard selectedCategoryIndex >= 0 && selectedCategoryIndex < categories.count else {
            print("Invalid category selected")
            return
        }

        let selectedCategory = categories[selectedCategoryIndex]
        print("Selected Category: \(selectedCategory)")

        BudgetManager.shared.updateSpent(for: selectedCategory, by: amount)
        if let budget = BudgetManager.shared.getBudget(for: selectedCategory) {
            print("Updated Budget for \(selectedCategory): Spent = \(budget.spent), Remaining = \(budget.remaining)")
        }
        let selectedAccountIndex = bankAccountSegmentedControl.selectedSegmentIndex
        let updateSuccess = AccountManager.shared.updateAccountBalance(for: selectedAccountIndex, by: -amount)
        if !updateSuccess {
            showAlert(title: "Error", message: "Insufficient funds.")
            return
        }
        NotificationCenter.default.post(name: .expenseUpdated, object: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
}
