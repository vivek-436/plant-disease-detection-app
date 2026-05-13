import 'package:flutter/material.dart';
import 'package:agro_gaurdian/Screens/home_screen.dart';
import 'package:agro_gaurdian/Screens/scan_screen.dart';
import 'package:agro_gaurdian/Screens/chatbot_screen.dart';
import 'package:agro_gaurdian/Screens/profile_screen.dart';

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
    const ChatBotScreen(),
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
