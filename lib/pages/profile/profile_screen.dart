import 'package:expanse_tracker/pages/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'), // Replace with actual profile picture
          ),
          const SizedBox(height: 10),
          const Text(
            textAlign: TextAlign.center,
            'Charles David',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProfileScreen.routeName);
            },
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          // const SizedBox(height: 10),
          const Card(
            elevation: 0,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 12),
                  child: Text(
                    "Profile Settings",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                ProfileOption(title: 'Language', icon: Icons.language),
                ProfileOption(
                    title: 'Synchronized bank accounts',
                    icon: Icons.account_balance),
                ProfileOption(title: 'Category', icon: Icons.category),
                ProfileOption(title: 'Currency', icon: Icons.attach_money),
                ProfileOption(title: 'Insights', icon: Icons.insights),
                ProfileOption(
                    title: 'Notifications', icon: Icons.notifications),
                ProfileOption(title: 'Settings', icon: Icons.settings),
                ProfileOption(
                    title: 'FAQ and Support', icon: Icons.help_outline),
                ProfileOption(title: 'Privacy', icon: Icons.lock),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileOption({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle option tap
      },
    );
  }
}
