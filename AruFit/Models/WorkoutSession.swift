import Foundation

struct WorkoutSession: Identifiable, Codable {
    let id: UUID
    var workout: Workout
    var startTime: Date
    var endTime: Date?
    var exerciseResults: [ExerciseResult]
    var notes: String?
    
    struct ExerciseResult: Identifiable, Codable {
        let id: UUID
        var exercise: Exercise
        var sets: [SetResult]
        var formFeedback: [FormFeedback]
    }
    
    struct SetResult: Identifiable, Codable {
        let id: UUID
        var reps: Int
        var weight: Double?
        var duration: TimeInterval
        var rpe: Int? // Rate of Perceived Exertion (1-10)
    }
    
    struct FormFeedback: Identifiable, Codable {
        let id: UUID
        var timestamp: Date
        var feedback: String
        var confidence: Double
        var suggestedCorrection: String?
    }
}