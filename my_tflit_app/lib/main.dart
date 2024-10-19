import 'package:agro_gaurdian/extrascreen/translations.dart';
import 'package:flutter/material.dart';

import 'package:agro_gaurdian/Screens/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: AppTranslations(), // Add translations
      locale: Locale('en', 'US'), // Default locale
      fallbackLocale: Locale(
          'en', 'US'), // Fallback locale if chosen locale is not available
      home: SplashScreen(),
    );
  }
}
