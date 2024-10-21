import 'dart:io';

import 'package:agro_gaurdian/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Detail remedy ',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Result :",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: secondaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Your Diesies is "),
                      const SizedBox(
                        height: 8,
                      ),
                      Image.asset(
                        "assets/nursery.png",
                        height: 150,
                        width: 250,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Recomandation",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.teal)),
                child: const Column(
                  children: [
                    Text(
                      'Galmidge disease is caused by tiny flies called gall midges, whose larvae form galls (abnormal growths) on plants by feeding on their tissues. This disease is common in crops like rice, wheat, and sorghum'
                      'Symptoms: Galls (swollen growths) on stems, leaves, or flowers'
                      'Stunted growth and reduced yields'
                      'Leaf twisting or rolling',
                      style: TextStyle(
                          fontSize: 14, height: 1.5, letterSpacing: 1),
                    ),
                    Text(
                      'Common Gall Midges: '
                      'Rice Gall Midge (Orseolia oryzae)'
                      'Wheat Gall Midge (Hessian key, Mayetiola destructor)'
                      'Sorghum Gall Midge (Contarinia sorghicola)',
                      style: TextStyle(
                          fontSize: 14, height: 1.5, letterSpacing: 1),
                    ),
                    Text(
                      'Management:'
                      'Cultural control: Early planting, crop rotation, and removal of infected parts'
                      'Biological control: Use of natural predators like parasitic wasps'
                      'Chemical control: Insecticides when necessary',
                      style: TextStyle(
                          fontSize: 14, height: 1.5, letterSpacing: 1),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
