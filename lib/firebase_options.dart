import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_WEB_API_KEY']!,
        appId: dotenv.env['FIREBASE_WEB_APP_ID']!,
        messagingSenderId: dotenv.env['FIREBASE_WEB_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_WEB_PROJECT_ID']!,
        authDomain: dotenv.env['FIREBASE_WEB_AUTH_DOMAIN'],
        storageBucket: dotenv.env['FIREBASE_WEB_STORAGE_BUCKET'],
        measurementId: dotenv.env['FIREBASE_WEB_MEASUREMENT_ID'],
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return FirebaseOptions(
          apiKey: dotenv.env['FIREBASE_ANDROID_API_KEY']!,
          appId: dotenv.env['FIREBASE_ANDROID_APP_ID']!,
          messagingSenderId:
              dotenv.env['FIREBASE_ANDROID_MESSAGING_SENDER_ID']!,
          projectId: dotenv.env['FIREBASE_ANDROID_PROJECT_ID']!,
          storageBucket: dotenv.env['FIREBASE_ANDROID_STORAGE_BUCKET'],
        );

      case TargetPlatform.iOS:
        return FirebaseOptions(
          apiKey: dotenv.env['FIREBASE_IOS_API_KEY']!,
          appId: dotenv.env['FIREBASE_IOS_APP_ID']!,
          messagingSenderId: dotenv.env['FIREBASE_IOS_MESSAGING_SENDER_ID']!,
          projectId: dotenv.env['FIREBASE_IOS_PROJECT_ID']!,
          storageBucket: dotenv.env['FIREBASE_IOS_STORAGE_BUCKET'],
          iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID'],
        );

      case TargetPlatform.macOS:
        return FirebaseOptions(
          apiKey: dotenv.env['FIREBASE_IOS_API_KEY']!,
          appId: dotenv.env['FIREBASE_IOS_APP_ID']!,
          messagingSenderId: dotenv.env['FIREBASE_IOS_MESSAGING_SENDER_ID']!,
          projectId: dotenv.env['FIREBASE_IOS_PROJECT_ID']!,
          storageBucket: dotenv.env['FIREBASE_IOS_STORAGE_BUCKET'],
          iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID'],
        );

      case TargetPlatform.windows:
        return FirebaseOptions(
          apiKey: dotenv.env['FIREBASE_WEB_API_KEY']!,
          appId: dotenv.env['FIREBASE_WEB_APP_ID']!,
          messagingSenderId: dotenv.env['FIREBASE_WEB_MESSAGING_SENDER_ID']!,
          projectId: dotenv.env['FIREBASE_WEB_PROJECT_ID']!,
          authDomain: dotenv.env['FIREBASE_WEB_AUTH_DOMAIN'],
          storageBucket: dotenv.env['FIREBASE_WEB_STORAGE_BUCKET'],
          measurementId: dotenv.env['FIREBASE_WEB_MEASUREMENT_ID'],
        );

      case TargetPlatform.linux:
        throw UnsupportedError(
          'Firebase options not configured for Linux — add keys in .env if needed.',
        );

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}
