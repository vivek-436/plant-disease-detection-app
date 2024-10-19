import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
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
          icon: Icon(Icons.arrow_back, color: Colors.black),
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
            SizedBox(height: 10),
            CircleAvatar(
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
            SizedBox(height: 10),
            Text(
              'Vivek Maurya',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Mobile Number (non-editable)
            ListTile(
              title: Text('Mobile Number',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              subtitle: Text(
                '+91 XXXXX XXXXX',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            // Email (Editable)
            ListTile(
              title: Text('Email',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              subtitle: TextField(
                controller: emailController,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit, color: Colors.teal),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Address (Editable)
            ListTile(
              title: Text('Address',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              subtitle: TextField(
                controller: addressController,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit, color: Colors.teal),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Update Profile Button
            ElevatedButton(
              onPressed: () {
                // Implement Update Profile action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text('Update Profile', style: TextStyle(fontSize: 18)),
            ),
            Spacer(),
            // Logout Button
            ListTile(
              leading: Icon(Icons.logout, color: Colors.teal),
              title: Text('Logout',
                  style: TextStyle(color: Colors.teal, fontSize: 18)),
              onTap: () {
                // Implement Logout action
              },
            ),
            SizedBox(height: 20),
            // Help and Version
            TextButton.icon(
              onPressed: () {
                // Implement Help action
              },
              icon: Icon(Icons.help_outline, color: Colors.blue),
              label: Text('Need Help?', style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 5),
            Text('Version 1.9.1', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
