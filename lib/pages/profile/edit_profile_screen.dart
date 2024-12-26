import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = "Edit_profile";
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with actual profile picture
            ),
            TextButton(
              onPressed: () {
                // Add functionality to change photo
              },
              child: const Text(
                'Change Photo',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            const FieldTitle(title: "Full Name"),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const FieldTitle(title: "Phone Number"),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Phone number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const FieldTitle(title: "Email"),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const FieldTitle(title: "Location"),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add save changes functionality
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class FieldTitle extends StatelessWidget {
  final String title;

  const FieldTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
