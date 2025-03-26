import SwiftUI
import Charts

struct ProgressView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            List {
                GoalsSection(goals: userViewModel.currentUser?.fitnessGoals ?? [])
                
                WorkoutHistorySection(history: userViewModel.workoutHistory)
                
                StatsSection()
            }
            .navigationTitle("Progress")
        }
    }
}

struct GoalsSection: View {
    let goals: [FitnessGoal]
    
    var body: some View {
        Section(header: Text("Goals")) {
            ForEach(goals) { goal in
                GoalProgressView(goal: goal)
            }
        }
    }
}

struct GoalProgressView: View {
    let goal: FitnessGoal
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(goal.type.rawValue.capitalized)
                .font(.headline)
            
            ProgressBar(progress: goal.progress / goal.target)
            
            Text("Target: \(goal.target, specifier: "%.1f")")
                .font(.caption)
        }
    }
}

struct ProgressBar: View {
    let progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 20)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Rectangle()
                    .frame(width: min(CGFloat(progress) * geometry.size.width, geometry.size.width), height: 20)
                    .foregroundColor(.blue)
            }
            .cornerRadius(10)
        }
    }
}

struct WorkoutHistorySection: View {
    let history: [WorkoutSession]
    
    var body: some View {
        Section(header: Text("Recent Workouts")) {
            ForEach(history) { session in
                WorkoutHistoryRow(session: session)
            }
        }
    }
}

struct WorkoutHistoryRow: View {
    let session: WorkoutSession
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(session.workout.name)
                .font(.headline)
            
            Text(formattedDate(session.startTime))
                .font(.caption)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}