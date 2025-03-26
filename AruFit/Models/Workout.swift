import Foundation

struct Workout: Identifiable, Codable {
    let id: UUID
    var name: String
    var exercises: [WorkoutExercise]
    var totalDuration: TimeInterval
    var restBetweenExercises: TimeInterval
    
    struct WorkoutExercise: Identifiable, Codable {
        let id: UUID
        var exercise: Exercise
        var sets: Int
        var reps: Int
        var weight: Double?
        var restBetweenSets: TimeInterval
        var notes: String?
    }
}