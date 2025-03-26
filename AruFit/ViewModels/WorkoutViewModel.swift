import Foundation
import Combine
import CoreML
import Vision

class WorkoutViewModel: ObservableObject {
    @Published var currentWorkout: Workout?
    @Published var currentExercise: Workout.WorkoutExercise?
    @Published var currentSet: Int = 1
    @Published var restTimeRemaining: TimeInterval = 0
    @Published var isResting: Bool = false
    @Published var formFeedback: [WorkoutSession.FormFeedback] = []
    
    private var timer: Timer?
    private var poseEstimator: PoseEstimator?
    
    init() {
        setupPoseEstimator()
    }
    
    private func setupPoseEstimator() {
        // Initialize pose estimation using Vision framework
        poseEstimator = PoseEstimator()
    }
    
    func startWorkout(_ workout: Workout) {
        currentWorkout = workout
        currentExercise = workout.exercises.first
        startExercise()
    }
    
    func startExercise() {
        guard let exercise = currentExercise else { return }
        // Initialize form tracking and feedback
        formFeedback = []
    }
    
    func completeSet() {
        guard let exercise = currentExercise else { return }
        if currentSet < exercise.sets {
            currentSet += 1
            startRestTimer(duration: exercise.restBetweenSets)
        } else {
            moveToNextExercise()
        }
    }
    
    private func startRestTimer(duration: TimeInterval) {
        isResting = true
        restTimeRemaining = duration
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateRestTimer()
        }
    }
    
    private func updateRestTimer() {
        if restTimeRemaining > 0 {
            restTimeRemaining -= 1
        } else {
            stopRestTimer()
        }
    }
    
    private func stopRestTimer() {
        timer?.invalidate()
        timer = nil
        isResting = false
    }
    
    private func moveToNextExercise() {
        guard let workout = currentWorkout,
              let currentIndex = workout.exercises.firstIndex(where: { $0.id == currentExercise?.id }) else { return }
        
        let nextIndex = currentIndex + 1
        if nextIndex < workout.exercises.count {
            currentExercise = workout.exercises[nextIndex]
            currentSet = 1
            startExercise()
        } else {
            completeWorkout()
        }
    }
    
    private func completeWorkout() {
        // Save workout session and cleanup
        currentWorkout = nil
        currentExercise = nil
        currentSet = 1
    }
}