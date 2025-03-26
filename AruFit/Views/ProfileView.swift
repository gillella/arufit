import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var isEditingProfile = false
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var height: Double = 0
    @State private var weight: Double = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    if isEditingProfile {
                        TextField("Name", text: $name)
                        TextField("Email", text: $email)
                        
                        HStack {
                            Text("Height (cm)")
                            Spacer()
                            TextField("", value: $height, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("Weight (kg)")
                            Spacer()
                            TextField("", value: $weight, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                        }
                    } else {
                        ProfileInfoRow(title: "Name", value: name)
                        ProfileInfoRow(title: "Email", value: email)
                        ProfileInfoRow(title: "Height", value: "\(height, specifier: "%.1f") cm")
                        ProfileInfoRow(title: "Weight", value: "\(weight, specifier: "%.1f") kg")
                    }
                }
                
                Section(header: Text("Goals")) {
                    NavigationLink("Manage Goals") {
                        GoalsManagementView()
                    }
                }
                
                Section(header: Text("App Settings")) {
                    Toggle("Voice Commands", isOn: .constant(true))
                    Toggle("AI Form Feedback", isOn: .constant(true))
                    Toggle("Rest Timer Alerts", isOn: .constant(true))
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                Button(isEditingProfile ? "Save" : "Edit") {
                    if isEditingProfile {
                        userViewModel.updateProfile(
                            name: name,
                            email: email,
                            height: height,
                            weight: weight
                        )
                    }
                    isEditingProfile.toggle()
                }
            }
        }
    }
}

struct ProfileInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .foregroundColor(.gray)
        }
    }
}

struct GoalsManagementView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var isAddingGoal = false
    
    var body: some View {
        List {
            ForEach(userViewModel.currentUser?.fitnessGoals ?? []) { goal in
                GoalRow(goal: goal)
            }
        }
        .navigationTitle("Goals")
        .toolbar {
            Button("Add Goal") {
                isAddingGoal = true
            }
        }
        .sheet(isPresented: $isAddingGoal) {
            AddGoalView()
        }
    }
}

struct GoalRow: View {
    let goal: FitnessGoal
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(goal.type.rawValue.capitalized)
                .font(.headline)
            
            ProgressView(value: goal.progress, total: goal.target)
            
            Text("Target: \(goal.target, specifier: "%.1f")")
                .font(.caption)
        }
    }
}