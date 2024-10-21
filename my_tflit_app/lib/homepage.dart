import 'dart:io';

import 'package:agro_gaurdian/Screens/detail_page.dart';
import 'package:agro_gaurdian/catagory/product.dart';
import 'package:agro_gaurdian/extrascreen/product_page.dart';
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductCard(product: productlist[0])));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Crops', 'assets/crops.png'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductCard(product: productlist[1])));
                  },
                ),
                InkWell(
                  child:
                      buildCategoryCard('Nursery Plants', 'assets/nursery.png'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductCard(product: productlist[2])));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Poultry', 'assets/poultry.png'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductCard(product: productlist[3])));
                  },
                ),
                InkWell(
                  child:
                      buildCategoryCard('Apiculture', 'assets/apiculture.png'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductCard(product: productlist[4])));
                  },
                ),
                InkWell(
                  child: buildCategoryCard('Drip Pipelines', 'assets/drip.png'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductCard(product: productlist[5])));
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
class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? filePath;
  String label = '';
  double confidence = 0.0;
  String Description = '';

  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);

    if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      Description = recognitions[0]['Description'].toString();
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  }

  pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);

    if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  }

  // Function to show details of the detected disease
  void _showDiseaseDetails(
      String disease, double accuracy, String Description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$disease Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Disease Name: $disease"),
              Text("Detection Confidence: ${accuracy.toStringAsFixed(0)}%"),
              Text("Description: $Description"),
              // Add more disease details here
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail(),
                      ));
                },
                child: const Text('Remedy'))
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfLteInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Card(
                color: Colors.teal,
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          height: 280,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage('assets/upload.jpg'),
                            ),
                          ),
                          child: filePath == null
                              ? const Text('')
                              : Image.file(
                                  filePath!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                label,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              if (label.isNotEmpty && confidence > 0)
                                Text(
                                  "The Accuracy is ${confidence.toStringAsFixed(0)}%",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              const SizedBox(
                                height: 12,
                              ),
                              // Show "View Details" button only when an image is detected
                              if (label.isNotEmpty && confidence > 0)
                                ElevatedButton(
                                  onPressed: () {
                                    _showDiseaseDetails(
                                        label, confidence, Description);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "View Details",
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  pickImageCamera();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    foregroundColor: Colors.black),
                child: const Text(
                  "Take a Photo",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  pickImageGallery();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    foregroundColor: Colors.black),
                child: const Text(
                  "Pick from gallery",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
