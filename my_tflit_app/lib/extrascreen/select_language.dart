import 'package:agro_gaurdian/extrascreen/get_start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatelessWidget {
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Switch to English
                var locale = Locale('en', 'US');
                Get.updateLocale(locale);
              },
              child: Text('Switch to English'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Switch to Hindi
                var locale = Locale('hi', 'IN');
                Get.updateLocale(locale);
              },
              child: Text('स्विच करें हिंदी में'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyGetpage()));
                },
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
