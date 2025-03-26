import Foundation

struct Exercise: Identifiable, Codable {
    let id: UUID
    var name: String
    var description: String
    var muscleGroups: [MuscleGroup]
    var difficulty: ExerciseDifficulty
    var formVideoURL: URL?
    var equipment: [Equipment]
    
    enum ExerciseDifficulty: String, Codable {
        case beginner
        case intermediate
        case advanced
    }
}

enum MuscleGroup: String, Codable {
    case chest
    case back
    case shoulders
    case legs
    case arms
    case core
    case fullBody
}

enum Equipment: String, Codable {
    case noEquipment
    case dumbbell
    case barbell
    case kettlebell
    case resistanceBand
    case machine
    case other
}