import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
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
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            const SizedBox(height: 20),
            // Mobile Number (non-editable)
            const ListTile(
              title: Text('Mobile Number',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              subtitle: Text(
                '+91 XXXXX XXXXX',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            // Email (Editable)
            ListTile(
              title: const Text('Email',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              subtitle: TextField(
                controller: emailController,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              subtitle: TextField(
                controller: addressController,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child:
                  const Text('Update Profile', style: TextStyle(fontSize: 18)),
            ),
            const Spacer(),
            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.teal),
              title: const Text('Logout',
                  style: TextStyle(color: Colors.teal, fontSize: 18)),
              onTap: () {
                // Implement Logout action
              },
            ),
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
