# 🏋️ Super Fitness  - Mobile Application

<br><br>

<div align="center">
  <img width="243" height="151" alt="Image" src="https://github.com/user-attachments/assets/202b2138-0ede-4ef1-a7f5-23f54c0ede91" />

<br><br>

  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://developer.android.com/)
  [![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://developer.apple.com/ios/)
  [![BLoC](https://img.shields.io/badge/BLoC-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://bloclibrary.dev/)
  [![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
</div>

## 📱 نظرة عامة / Overview

**Fitness App** هو تطبيق Flutter متكامل لتتبع اللياقة البدنية والتغذية يتيح للمستخدمين تتبع التمارين الرياضية والوجبات الغذائية وإدارة أهدافهم الصحية مع دعم الذكاء الاصطناعي للاستشارات الشخصية.

**Fitness App** is a comprehensive Flutter fitness tracking application that allows users to track exercises and meals, manage their health goals, and receive AI-powered personalized fitness coaching and nutrition advice.

## ✨ المميزات الرئيسية / Key Features

### 🎯 المميزات الأساسية / Core Features

- **🔐 المصادقة والتسجيل** - تسجيل دخول وتسجيل حساب جديد آمن
- **📧 التحقق من البريد الإلكتروني** - التحقق من البريد الإلكتروني عبر Firebase
- **🔑 استعادة كلمة المرور** - استعادة كلمة المرور المنسية بأمان
- **🏃 تتبع التمارين الرياضية** - تصفح وتتبع مختلف أنواع التمارين
- **🍎 إدارة التغذية** - تتبع الوجبات الغذائية بالسعرات الحرارية والمغذيات
- **📊 مراقبة الأداء** - عرض إحصائيات وتحليلات الأداء الشخصية
- **👤 إدارة الملف الشخصي** - عرض وتعديل البيانات الشخصية والأهداف
- **🤖 محادثة ذكية مع الذكاء الاصطناعي** - استشارات لياقة بدنية وتغذية شخصية
- **🌐 دعم متعدد اللغات** - دعم اللغة العربية والإنجليزية
- **🎬 محتوى تعليمي** - فيديوهات تعليمية على YouTube متكاملة

### 🎯 Core Features

- **🔐 Authentication & Registration** - Secure user login and account creation
- **📧 Email Verification** - Firebase-based email verification
- **🔑 Password Recovery** - Secure password recovery
- **🏃 Exercise Tracking** - Browse and track various exercise types
- **🍎 Nutrition Management** - Track meals with calorie and nutrient information
- **📊 Performance Analytics** - View personal performance statistics and insights
- **👤 Profile Management** - View and edit user information and fitness goals
- **🤖 AI-Powered Chat** - Get personalized fitness and nutrition advice
- **🌐 Multi-Language Support** - Support for Arabic and English
- **🎬 Educational Content** - Integrated YouTube educational videos

## 🛠️ التقنيات المستخدمة / Technologies Used

### Frontend Framework
- **Flutter** - Cross-platform mobile development framework
- **Dart** - Programming language
- **Material Design 3** - Modern UI design system
- **Responsive Framework** - Responsive design & screen adaptation

### State Management
- **Flutter BLoC** - Predictable state management
- **Cubit** - Lightweight state management for simple states
- **Provider Pattern** - Dependency injection via BlocProvider

### Data Management & APIs
- **Firebase Authentication** - User authentication & management
- **Firebase Realtime Database** - Real-time data synchronization
- **Retrofit** - Type-safe HTTP client for REST APIs
- **Dio** - Powerful HTTP client with interceptors
- **Hive** - Fast, lightweight local key-value database
- **Secure Storage** - Encrypted credential & token storage

### AI Integration
- **Gemini API** - Google's generative AI for fitness coaching
- **ChatGPT API** - OpenAI's language model for nutrition advice
- **Firebase AI** - Machine learning capabilities

### Networking & Logging
- **Dio** - HTTP client with request/response interceptors
- **Pretty Dio Logger** - Beautiful network request logging
- **Flutter Dotenv** - Environment configuration management

### UI/UX Libraries
- **Cached Network Image** - Efficient image caching
- **Flutter SVG** - SVG rendering support
- **Skeletonizer** - Skeleton loading animations
- **Shimmer** - Shimmer loading effects
- **Blur & BlurBox** - Blur effects for UI
- **Percent Indicator** - Progress and percentage indicators
- **YouTube Player** - YouTube video integration
- **Image Picker** - Local image selection

### Additional Features
- **Easy Localization** - Internationalization & localization
- **Flutter Secure Storage** - Secure credential storage
- **Flutter Native Splash** - Custom splash screens
- **Flutter Launcher Icons** - App icon generation
- **Number Picker** - Number selection widget
- **Equatable** - Value equality for Dart objects

### Development Tools
- **Build Runner** - Code generation for JSON serialization
- **Injectable** - Code generation for dependency injection
- **JSON Serializable** - Automatic JSON encoding/decoding
- **Retrofit Generator** - API client code generation
- **Flutter Lints** - Linting rules
- **Bloc Test** - BLoC testing utilities
- **Mockito** - Mocking framework for testing

## 🏗️ Architecture

### Clean Architecture Pattern

The project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                          # Core functionality & shared code
│   ├── aiLayer/                   # AI/ML integration (Gemini, ChatGPT)
│   ├── config/                    # Configuration
│   │   ├── routing/               # Navigation & route generation
│   │   └── theme/                 # App theme, colors, fonts
│   ├── di/                        # Dependency injection setup
│   ├── enum/                      # Enumerations
│   ├── errors/                    # Error handling & failures
│   ├── functions/                 # Utility functions
│   ├── helpers/                   # Helper classes (BLocObserver, etc.)
│   ├── models/                    # Shared data models
│   ├── services/                  # Core services (storage, database)
│   ├── utils/                     # Constants, sizes, device detection
│   ├── localization/              # Translation files
│   └── widgets/                   # Reusable widgets
│
├── features/                      # Feature modules (DDD structure)
│   ├── auth/                      # Authentication
│   │   ├── api/                   # Retrofit API clients
│   │   ├── data/                  # Models, repositories, data sources
│   │   ├── domain/                # Entities, interfaces, use cases
│   │   └── presentation/          # Pages, widgets, BLoC/Cubit
│   ├── exercise/                  # Exercise tracking
│   ├── food/                      # Food/nutrition tracking
│   ├── foodDetails/               # Food item details
│   ├── aiChat/                    # AI-powered chat
│   ├── profileMain/               # User profile
│   ├── editProfile/               # Profile editing
│   ├── changePassowrd/            # Password change
│   ├── mainLayout/                # Main navigation layout
│   │   └── tabs/                  # Navigation tabs
│   └── on_boarding/               # Onboarding screens
│
└── main.dart                      # App entry point
```

### Architecture Layers

1. **Presentation Layer** - UI, widgets, and state management (BLoC/Cubit)
   - Pages, custom widgets, BLoCs for state management
   
2. **Domain Layer** - Business logic and entity models
   - Use cases, repository interfaces, domain entities
   - No external dependencies (pure Dart)
   
3. **Data Layer** - Data sources and repository implementations
   - API clients (Retrofit), models, local storage
   - Repository implementations that fetch from remote/local sources

### Design Patterns

- **Repository Pattern** - Abstraction of data sources
- **BLoC Pattern** - Predictable state management
- **Dependency Injection** - Loose coupling via GetIt + Injectable
- **Use Case Pattern** - Encapsulation of business logic
- **Factory Pattern** - AI model instantiation (Gemini, ChatGPT)

## 📸 لقطات الشاشة / Screenshots

*Screenshots will be uploaded later*

## 🚀 المميزات التقنية / Technical Features

### Performance Optimizations
- **Image Caching** - Efficient image loading and caching with CachedNetworkImage
- **Local Storage** - Fast data access with Hive for offline support
- **Lazy Loading** - Efficient data loading and pagination
- **Memory Management** - Optimized resource usage
- **Skeleton Loading** - Better perceived performance with shimmer effects

### State Management
- **BLoC Pattern** - Predictable state changes with event-driven architecture
- **Cubit** - Lightweight state management for simple state (e.g., locale)
- **Stream-based Updates** - Real-time data synchronization via Firebase

### User Experience
- **Responsive Design** - Works on all screen sizes (phones, tablets)
- **Smooth Animations** - Fluid transitions and visual feedback
- **Loading States** - Clear user feedback during data fetching
- **Error Handling** - Graceful error management with user-friendly messages
- **Toast Notifications** - Non-intrusive user notifications
- **Internationalization** - Seamless Arabic/English language switching

### Data Persistence
- **Firebase Realtime Database** - Cloud synchronization
- **Hive Database** - Fast local caching
- **Secure Storage** - Encrypted token & credential storage
- **Shared Preferences** - Simple key-value storage for app preferences

### Networking
- **REST API Integration** - Retrofit for type-safe API communication
- **Firebase SDK** - Real-time database and authentication
- **Dio Interceptors** - Request/response handling and logging
- **Error Handling** - Comprehensive error mapping (ServerFailure, FirebaseFailure)
- **Network Monitoring** - Connectivity status checking

## 📱 المنصات المدعومة / Supported Platforms

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 11+)
- 🔄 **Web** (In Development)
- 🔄 **Windows** (Planning)

## 🎨 Feature Modules Breakdown

### Authentication Module
- User registration with validation
- Secure Firebase login
- Email verification
- Password recovery
- Secure token storage
- Remember me functionality

### Exercise Module
- Browse exercise categories
- View exercise details with instructions
- Track exercise history
- Search and filter exercises
- Exercise performance statistics

### Nutrition Module
- Browse food items and meals
- Track daily nutrition intake
- View calorie and nutrient information
- Search food database
- Meal history tracking

### AI Chat Module
- Real-time chat with Gemini or ChatGPT
- Personalized fitness advice
- Nutrition recommendations
- Workout suggestions
- Conversation history

### Profile Module
- User information display
- Edit weight, height, age, goals
- Activity level management
- Profile picture management
- Progress statistics dashboard

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK 3.0+
- Android Studio or Xcode
- Firebase account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/wasimGhoniem/Fitness-App.git
   cd Fitness-App
   ```

2. **Install dependencies**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Firebase**
   ```bash
   flutterfire configure
   ```

5. **Create .env file**
   ```
   # Add your API keys
   GEMINI_API_KEY=your_gemini_key
   CHATGPT_API_KEY=your_chatgpt_key
   API_BASE_URL=your_api_url
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

## 🔧 Configuration

### Environment Setup

Create a `.env` file in the project root:

```env
GEMINI_API_KEY=your_api_key
CHATGPT_API_KEY=your_api_key
API_BASE_URL=https://api.example.com
```

### Firebase Setup

1. Configure Firebase in `lib/firebase_options.dart`
2. Ensure `google-services.json` is in `android/app/`
3. Ensure `GoogleService-Info.plist` is in `ios/Runner/`

### Theme Customization

Customize app theme in `lib/core/config/theme/app_theme.dart`:
- Colors, typography, component themes
- Light theme configuration

### Localization

Add translations in `lib/core/localization/`:
- English: `app_en.arb`
- Arabic: `app_ar.arb`

Access translations: `context.tr('key_name')`

## 🧪 Testing

Run tests with:

```bash
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/auth/domain/usecases/sign_in_usecase_test.dart
```

## 🤝 المساهمة / Contributing

نرحب بمساهماتكم! يرجى اتباع الخطوات التالية:

We welcome contributions! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Guidelines

- Follow Flutter and Dart best practices
- Write clean, maintainable, documented code
- Follow the Clean Architecture principles
- Add comments for complex business logic
- Write meaningful commit messages
- Test your changes thoroughly
- Follow the existing code style and conventions

## 📋 Project Structure Best Practices

- Each feature is self-contained with its own data, domain, and presentation layers
- Core utilities and shared code are in the `core` folder
- Use dependency injection for loose coupling
- Implement repository pattern for data abstraction
- Use BLoC for feature state management
- Handle all errors consistently with custom Failure classes

## 🐛 Known Issues

*No known issues at this moment*

## 👨‍💻 Team / المطورون

**Development Team**

- **Name**: Wasim Ghonim
- **Email**: wasimghoniem@gmail.com
- **GitHub**: https://www.linkedin.com/in/wasim-ghonim-37bb98333/
- **Role**: Flutter Developer

<br>

- **Name**: Moataz Ebrahim
- **Email**: moatazebrahim221@gmail.com
- **GitHub**: https://github.com/Eng-M0ataz
- **Role**: Flutter Developer

## 📞 Support

إذا واجهت أي مشاكل أو لديك أسئلة، يرجى فتح issue في GitHub.

If you encounter any issues or have questions, please open an issue on GitHub.

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev/) - For the amazing framework
- [BLoC Library](https://bloclibrary.dev/) - For predictable state management
- [Firebase](https://firebase.google.com/) - For backend services
- [Retrofit](https://pub.dev/packages/retrofit) - For type-safe HTTP clients
- [Hive](https://pub.dev/packages/hive) - For fast local storage
- [Google Gemini API](https://ai.google.dev/) - For AI capabilities
- [OpenAI ChatGPT](https://openai.com/) - For language model integration
- All contributors and the amazing open-source community

---

<div align="center">
  <p>صُنع بـ ❤️ باستخدام Flutter</p>
  <p>Made with ❤️ using Flutter</p>
  <br>
  <p>⭐ If you find this project helpful, please consider giving it a star!</p>
</div>
