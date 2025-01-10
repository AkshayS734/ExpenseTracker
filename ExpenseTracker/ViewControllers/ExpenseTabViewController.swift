import UIKit

class ExpenseTabViewController: UIViewController {

    
    
    @IBOutlet weak var totalExpenseTextField: UITextField!
    @IBOutlet weak var educationExpenseTextField: UITextField!
    @IBOutlet weak var healthcareExpenseTextField: UITextField!
    @IBOutlet weak var travelExpenseTextField: UITextField!
    @IBOutlet weak var foodExpenseTextField: UITextField!
    @IBOutlet weak var rentExpenseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateExpenseFields), name: .expenseUpdated, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateExpenseFields() // Update fields on appearance too
    }
    
    @objc func updateExpenseFields() {
        educationExpenseTextField.text = String(format: "%.2f", Expense.shared.educationExpense)
        healthcareExpenseTextField.text = String(format: "%.2f", Expense.shared.healthcareExpense)
        travelExpenseTextField.text = String(format: "%.2f", Expense.shared.travelExpense)
        foodExpenseTextField.text = String(format: "%.2f", Expense.shared.foodExpense)
        rentExpenseTextField.text = String(format: "%.2f", Expense.shared.rentExpense)
        totalExpenseTextField.text = String(format: "%.2f", Expense.shared.totalExpense)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .expenseUpdated, object: nil)
    }

    
    @IBAction func educationBudgetButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showBudget", sender: "Education")
    }
    @IBAction func healthcareBudgetButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showBudget", sender: "Healthcare")
    }
    @IBAction func travelBudgetButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showBudget", sender: "Travel")
    }
    
    @IBAction func foodBudgetButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showBudget", sender: "Food")
    }
    @IBAction func rentBudgetButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showBudget", sender: "Rent")
    }
    
    @IBAction func unwindToExpenses (segue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBudget" {
            if let destination = segue.destination as? BudgetViewController {                destination.label = sender as? String
            }
            
        }
        
    }
    

    

}
