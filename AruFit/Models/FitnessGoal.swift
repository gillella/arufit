import Foundation

struct FitnessGoal: Identifiable, Codable {
    let id: UUID
    var type: GoalType
    var target: Double
    var startDate: Date
    var targetDate: Date
    var progress: Double
    var isCompleted: Bool
    
    enum GoalType: String, Codable {
        case weightLoss
        case muscleGain
        case strengthIncrease
        case endurance
        case flexibility
        case maintenance
    }
}