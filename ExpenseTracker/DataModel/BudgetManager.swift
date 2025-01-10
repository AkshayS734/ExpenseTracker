import Foundation
class BudgetManager {
    static let shared = BudgetManager()
    
    var budgets: [Budget]
    
    private init() {
        budgets = [
            Budget(category: "Education", sanctioned: 5000, spent: 0),
            Budget(category: "Healthcare", sanctioned: 3000, spent: 0),
            Budget(category: "Travel", sanctioned: 2000, spent: 0),
            Budget(category: "Food", sanctioned: 1500, spent: 0),
            Budget(category: "Rent", sanctioned: 7000, spent: 0)
        ]
    }
    
    func getBudget(for category: String) -> Budget? {
        return budgets.first { $0.category == category }
    }
    
    func updateSpent(for category: String, by amount: Double) {
        if let budget = getBudget(for: category) {
            budget.updateSpent(by: amount)
        }
    }
}
