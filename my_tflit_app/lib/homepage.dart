import 'dart:io';

import 'package:agro_gaurdian/Screens/previous_scan.dart';
import 'package:agro_gaurdian/Screens/scannerscreen.dart';
import 'package:agro_gaurdian/catagory/product.dart';
import 'package:agro_gaurdian/Screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

import 'dart:developer' as devtools;
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of pages to show based on bottom nav selection
  final List<Widget> _pages = [
    const HomeScreen(),
    const ScanScreen(),
    const AlertsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer header with profile
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              accountName: const Text('Vivek'),
              accountEmail: const Text('Edit profile'),
              currentAccountPicture: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.teal,
                backgroundImage: AssetImage(
                    'assets/profile_image.jpg'), // Use your image asset path
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(Icons.camera_alt,
                            size: 18, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
              onDetailsPressed: () {
                // Handle profile edit
              },
            ),
            // Drawer menu items
            buildDrawerItem(Icons.list, 'Categories', () {}),
            buildDrawerItem(Icons.bookmark, 'Saved Products', () {}),
            buildDrawerItem(Icons.shopping_bag, 'Your Products', () {}),
            buildDrawerItem(
                Icons.verified_user_rounded, 'Government Policies', () {}),
            buildDrawerItem(Icons.bar_chart, 'Market Rate', () {}),
            buildDrawerItem(Icons.campaign, 'Promote', () {}),
            buildDrawerItem(Icons.whatshot, 'WhatsApp', () {}),
            buildDrawerItem(Icons.ondemand_video, 'Learn from YouTube', () {}),
            buildDrawerItem(Icons.thumb_up, 'Rate Us', () {}),
            buildDrawerItem(Icons.cloud, 'Weather', () {}),
            buildDrawerItem(Icons.contact_page, 'Contact Us', () {}),
            buildDrawerItem(Icons.file_copy, 'T&C', () {}),
            buildDrawerItem(Icons.info, 'Know About Us', () {}),
            buildDrawerItem(Icons.logout, 'Logout', () {
              // Handle logout
            }),
          ],
        ),
      ),
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        elevation: 0,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'AgroGuardian',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                // Action for notification button
              },
            ),
          ],
        ),
      ),

      body: _pages[_currentIndex], // Display the current selected page here
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal[50],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex, // Track the current selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function to build drawer items
  ListTile buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}

// Home Screen Page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search any categories',
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                InkWell(
                  child:
                      buildCategoryCard('Pesticides', 'assets/pesticides.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductCard()));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Crops', 'assets/crops.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductCard()));
                  },
                ),
                InkWell(
                  child:
                      buildCategoryCard('Nursery Plants', 'assets/nursery.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductCard()));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Poultry', 'assets/poultry.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductCard()));
                  },
                ),
                InkWell(
                  child:
                      buildCategoryCard('Apiculture', 'assets/apiculture.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductCard()));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Drip Pipelines', 'assets/drip.png'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductCard()));
                  },
                ),
                buildCategoryCard('Tractors', 'assets/tractor.png'),
                buildCategoryCard('Rentals', 'assets/rentals.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create category cards
  Widget buildCategoryCard(String title, String iconPath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 50), // Replace with your icon paths
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.crop, color: Colors.orange, size: 40),
                        Icon(Icons.receipt, color: Colors.blue, size: 40),
                        Icon(Icons.medical_services,
                            color: Colors.green, size: 40),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
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
                                builder: (context) => ScannerScreen()));
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
                              builder: (context) => PreviousScan()));
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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

void main() {
  runApp(const MaterialApp(
    home: ScanScreen(),
  ));
}

// Alerts Screen Page
class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Alerts Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Profile Screen Page
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController =
      TextEditingController(text: 'vivekmaurya00999@gmail.com');
  TextEditingController addressController =
      TextEditingController(text: '----------------');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              backgroundImage: AssetImage(
                  'assets/profile_image.jpg'), // Use your image asset path
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child:
                          Icon(Icons.camera_alt, size: 18, color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Vivek Maurya',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Mobile Number (non-editable)
            const ListTile(
              title: Text('Mobile Number',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              subtitle: Text(
                '+91 XXXXX XXXXX',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            // Email (Editable)
            ListTile(
              title: const Text('Email',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              subtitle: TextField(
                controller: emailController,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.edit, color: Colors.teal),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Address (Editable)
            ListTile(
              title: const Text('Address',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              subtitle: TextField(
                controller: addressController,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.edit, color: Colors.teal),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Update Profile Button
            ElevatedButton(
              onPressed: () {
                // Implement Update Profile action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Update Profile',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),

            // Logout Button
            // ListTile(
            //   leading: Icon(
            //     Icons.logout,
            //     color: Colors.teal,
            //     size: 14,
            //   ),
            //   title: Text('Logout',
            //       style: TextStyle(color: Colors.teal, fontSize: 14)),
            //   onTap: () {
            //     // Implement Logout action
            //   },
            // ),
            const SizedBox(height: 20),
            // Help and Version
            TextButton.icon(
              onPressed: () {
                // Implement Help action
              },
              icon: const Icon(Icons.help_outline, color: Colors.blue),
              label: const Text('Need Help?',
                  style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 5),
            const Text('Version 1.9.1', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
