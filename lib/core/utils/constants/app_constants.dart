import 'package:flutter/material.dart';

abstract class AppConstants {
  static const List<Locale> supportedLocales = [Locale(en), Locale(ar)];
  static const String languageCode = 'language_code';
  static const String secureStorage = 'secureStorage';
  static const String en = 'en';
  static const String ar = 'ar';
  static const String assetsPath = 'assets/translations';
  static const String token = 'token';
  static const String rememberMe = 'remember_me';
  static const String male = 'male';
  static const String female = 'female';
  static const String chatgpt = 'chatgpt';
  static const String gemini = 'gemini';
  static const String imageDataType = 'image/jpeg';
  static const String obscuringCharacter = '★';
  static const String geminiModel = 'gemini-2.5-flash-lite';
  static const String apiRemoteExecutor = 'apiRemoteExecutor';
  static const String firebaseRemoteExecutor = 'firebaseRemoteExecutor';
  static const String firebaseRealTimeDatabase = 'firebaseRealTimeDatabase';
  static const String envKey = '.env';
  static const String abdominalsId = '67c79f3526895f87ce0aa96b';
}
