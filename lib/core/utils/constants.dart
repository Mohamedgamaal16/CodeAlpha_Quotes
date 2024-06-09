import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color kPrimaryColor = Color(0xFF313B4E);
  static const List<Color> buttonGradient = [
    Color(0xFF8A2387), // Purple
    Color(0xFFE94057), // Pinkish-Red
    Color(0xFFF27121), // Orange
  ];
  static const List<Color> nameGradient = [
    Color(0xFFEA8CCD),
    Color(0xFF7599E0),
    Color(0xFF6573A9),
    Color(0xFF54CDFB),
  ];
}

abstract class SharedPrefKeys {
  // Login Section
  static const String kSplashIsLoggedIn = 'SlpashLoggedIn';
  // Profile Section
  static const String kProfileName = 'ProfileName';
  static const String kProfileUserName = 'ProfileUserName';
  static const String kProfileImageLink = 'ProfileImageLink';
  static const String kProfileGenderIndex = 'ProfileGenderIndex';
  static const String kProfileEmail = 'ProfileEmail';
  static const String kProfilePasswrod = 'ProfilePassword';
  static const String kProfilePhone = 'ProfilePhone';
}


