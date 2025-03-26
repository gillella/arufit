import SwiftUI

struct WorkoutView: View {
    @StateObject private var workoutViewModel = WorkoutViewModel()
    @StateObject private var aiCoachViewModel = AICoachViewModel()
    
    var body: some View {
        NavigationView {
            if let currentWorkout = workoutViewModel.currentWorkout {
                ActiveWorkoutView(workout: currentWorkout)
            } else {
                WorkoutListView()
            }
        }
    }
}

struct ActiveWorkoutView: View {
    let workout: Workout
    @ObservedObject var workoutViewModel: WorkoutViewModel
    @ObservedObject var aiCoachViewModel: AICoachViewModel
    
    var body: some View {
        VStack {
            if let currentExercise = workoutViewModel.currentExercise {
                ExerciseView(exercise: currentExercise)
                
                if workoutViewModel.isResting {
                    RestTimerView(timeRemaining: workoutViewModel.restTimeRemaining)
                } else {
                    SetProgressView(currentSet: workoutViewModel.currentSet,
                                  totalSets: currentExercise.sets)
                }
                
                AIFeedbackView(feedback: aiCoachViewModel.currentFeedback)
            }
        }
        .navigationTitle(workout.name)
    }
}

struct ExerciseView: View {
    let exercise: Workout.WorkoutExercise
    
    var body: some View {
        VStack {
            Text(exercise.exercise.name)
                .font(.title)
            
            if let videoURL = exercise.exercise.formVideoURL {
                VideoPlayer(url: videoURL)
            }
            
            HStack {
                Text("\(exercise.reps) reps")
                if let weight = exercise.weight {
                    Text("\(weight, specifier: "%.1f") kg")
                }
            }
        }
    }
}

struct RestTimerView: View {
    let timeRemaining: TimeInterval
    
    var body: some View {
        VStack {
            Text("Rest Time")
                .font(.title2)
            Text(timeString(from: timeRemaining))
                .font(.system(size: 48, weight: .bold))
        }
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct AIFeedbackView: View {
    let feedback: String?
    
    var body: some View {
        if let feedback = feedback {
            Text(feedback)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
        }
    }
}