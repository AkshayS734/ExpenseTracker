import Foundation
class Budget {
    var category: String
    var sanctioned: Double
    var spent: Double
    
    var remaining: Double {
        return sanctioned - spent
    }
    
    init(category: String, sanctioned: Double,spent: Double) {
        self.category = category
        self.sanctioned = sanctioned
        self.spent = spent
    }
    
    func updateSpent(by amount: Double) {
        self.spent += amount
    }
}
