import 'package:agro_gaurdian/extrascreen/get_start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'.tr), // Translated text
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hello'.tr), // Translated text
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Switch to English
                var locale = const Locale('en', 'US');
                Get.updateLocale(locale);
              },
              child: const Text('Switch to English'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Switch to Hindi
                var locale = const Locale('hi', 'IN');
                Get.updateLocale(locale);
              },
              child: const Text('स्विच करें हिंदी में'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyGetpage()));
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
