import Foundation

class Expense {
    static let shared = Expense()
    
    var educationExpense: Double = 0.0
    var healthcareExpense: Double = 0.0
    var travelExpense: Double = 0.0
    var foodExpense: Double = 0.0
    var rentExpense: Double = 0.0
    var totalExpense: Double {
        educationExpense + healthcareExpense + travelExpense + foodExpense + rentExpense
    }

    private init() {}
}
