import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var workoutPlans: [WorkoutPlan] = []
    @Published var workoutHistory: [WorkoutSession] = []
    
    func updateProfile(name: String, email: String, height: Double, weight: Double) {
        guard var user = currentUser else { return }
        user.name = name
        user.email = email
        user.height = height
        user.weight = weight
        currentUser = user
        saveUser()
    }
    
    func addFitnessGoal(_ goal: FitnessGoal) {
        guard var user = currentUser else { return }
        user.fitnessGoals.append(goal)
        currentUser = user
        saveUser()
    }
    
    func updateGoalProgress(_ goal: FitnessGoal, progress: Double) {
        guard var user = currentUser else { return }
        if let index = user.fitnessGoals.firstIndex(where: { $0.id == goal.id }) {
            var updatedGoal = goal
            updatedGoal.progress = progress
            updatedGoal.isCompleted = progress >= goal.target
            user.fitnessGoals[index] = updatedGoal
            currentUser = user
            saveUser()
        }
    }
    
    private func saveUser() {
        // Implement persistence logic
    }
    
    func loadUser() {
        // Implement user loading logic
    }
}