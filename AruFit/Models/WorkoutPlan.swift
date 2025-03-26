import Foundation

struct WorkoutPlan: Identifiable, Codable {
    let id: UUID
    var name: String
    var description: String
    var difficulty: Exercise.ExerciseDifficulty
    var workouts: [Workout]
    var duration: TimeInterval
    var goal: FitnessGoal
    
    init(id: UUID = UUID(), name: String, description: String, difficulty: Exercise.ExerciseDifficulty, goal: FitnessGoal) {
        self.id = id
        self.name = name
        self.description = description
        self.difficulty = difficulty
        self.workouts = []
        self.duration = 0
        self.goal = goal
    }
}