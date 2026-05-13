import 'package:flutter/material.dart';

// Profile Screen Page
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController emailController =
      TextEditingController(text: 'vivekmaurya00999@gmail.com');
  final TextEditingController addressController =
      TextEditingController(text: '----------------');

  @override
  void dispose() {
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

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
