import 'package:agro_gaurdian/extrascreen/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:agro_gaurdian/Screens/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true, // required for DevicePreview
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      title: 'Flutter Demo',
      translations: AppTranslations(), // Add translations
      fallbackLocale: const Locale(
          'en', 'US'), // Fallback locale if chosen locale is not available
      home: const SplashScreen(),
    );
  }
}
