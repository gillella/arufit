# AruFit - AI-Powered Fitness Coach

AruFit is an innovative iOS fitness application that provides personalized workout experiences with real-time AI coaching, form feedback, and progress tracking.

## Features

- 🏋️‍♂️ **Custom Workout Creation**
  - Create personalized routines
  - Select exercises, sets, reps, and weights
  - Add form videos for reference

- 🤖 **AI Coaching**
  - Real-time form feedback
  - Adaptive workout adjustments
  - Motivational support

- 🗣️ **Voice Commands**
  - Hands-free navigation
  - Voice-controlled workout logging

- ⏱️ **Rest Interval Tracking**
  - Automatic rest period monitoring
  - Smart notifications

- 📊 **Progress Tracking**
  - Detailed workout logs
  - Performance analytics
  - Goal tracking

## Technical Stack

- Swift 5.9+
- SwiftUI
- Core ML for AI features
- AVFoundation for video processing
- Speech Recognition for voice commands
- CloudKit for data synchronization
- Vision framework for pose estimation

## Requirements

- iOS 17.0+
- Xcode 15.0+
- iPhone with TrueDepth camera (for form tracking)

## Installation

1. Clone the repository
```bash
git clone https://github.com/gillella/arufit.git
```

2. Open the project in Xcode
```bash
cd arufit
open AruFit.xcodeproj
```

3. Install dependencies via Swift Package Manager (SPM)
- The project uses SPM for dependency management
- Dependencies will be resolved automatically when opening the project

4. Build and run the project

## Architecture

The app follows the MVVM (Model-View-ViewModel) architecture pattern with Clean Architecture principles:

- **Models**: Core data structures
- **Views**: SwiftUI views
- **ViewModels**: Business logic and state management
- **Services**: API integration and data persistence
- **Utils**: Helper functions and extensions

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- CoreML for machine learning capabilities
- Vision framework for pose estimation
- AVFoundation for video processing