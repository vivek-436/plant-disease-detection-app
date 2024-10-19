import 'package:agro_gaurdian/Screens/register_screen.dart';
import 'package:agro_gaurdian/extrascreen/select_language.dart';
import 'package:agro_gaurdian/Screens/scanscreen.dart';
import 'package:agro_gaurdian/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGetpage extends StatelessWidget {
  const MyGetpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150),
        child: Container(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/Farmer1.png',
                  height: 330,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 110),
                child: SizedBox(
                  height: 72,
                  width: 283,
                  child: Text(
                    'Welcome to the   AgroGuardion !'.tr,
                    style: TextStyle(
                        color: Color.fromARGB(255, 30, 189, 189),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: secondaryColor),
                  height: 60,
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      'GetStart'.tr,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
