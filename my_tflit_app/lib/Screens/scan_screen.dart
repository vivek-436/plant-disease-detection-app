import 'package:flutter/material.dart';
import 'package:agro_gaurdian/Screens/previous_scan.dart';
import 'package:agro_gaurdian/Screens/scannerscreen.dart';

// Scan Screen Page
class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/upload_image.png',
                  height: 180,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Upload ',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'your crop photo to identify diseases and receive tailored solutions instantly.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.crop, color: Colors.orange, size: 40),
                        Icon(Icons.receipt, color: Colors.blue, size: 40),
                        Icon(Icons.medical_services,
                            color: Colors.green, size: 40),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text('Scan', style: TextStyle(fontSize: 16)),
                        SizedBox(
                            // width: 10,
                            ),
                        Text('Get Report', style: TextStyle(fontSize: 16)),
                        Text('Get a Cure', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle take a picture action
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScannerScreen()));
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text(
                        "Upload picture",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Previous scans",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all scans
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PreviousScan()));
                    },
                    child: const Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/plant_image.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "23 Jan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Healthy",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Complete",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.grey),
                      onPressed: () {
                        // Handle view details of this scan
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
