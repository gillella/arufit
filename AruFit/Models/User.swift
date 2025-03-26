import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var email: String
    var height: Double
    var weight: Double
    var fitnessGoals: [FitnessGoal]
    var workoutHistory: [WorkoutSession]
    
    init(id: UUID = UUID(), name: String, email: String, height: Double, weight: Double) {
        self.id = id
        self.name = name
        self.email = email
        self.height = height
        self.weight = weight
        self.fitnessGoals = []
        self.workoutHistory = []
    }
}