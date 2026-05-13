import 'package:agro_gaurdian/Screens/scannerscreen.dart';
import 'package:flutter/material.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController talukaController = TextEditingController();
  final TextEditingController villageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    stateController.dispose();
    districtController.dispose();
    talukaController.dispose();
    villageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your details !!'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField('Name*', 'Your first name', nameController),
              buildTextField('Surname*', 'Your surname', surnameController),
              buildTextField('Email (Optional)', 'Your email', emailController),
              buildTextField('State*', 'Your state', stateController),
              buildTextField('District*', 'Your district', districtController),
              buildTextField('Taluka*', 'Your taluka', talukaController),
              buildTextField('Village*', 'Your village', villageController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScannerScreen(),
                        ));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required';
          }
          return null;
        },
      ),
    );
  }
}
