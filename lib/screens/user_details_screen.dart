import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/screens/profile_screen.dart';
import 'package:tasky/widgets/custom_text_field.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final userquoteController = TextEditingController();
    setUserDetails() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userName', userNameController.text);
      prefs.setString('quote', userquoteController.text);
    }

    return Scaffold(
      appBar: AppBar(title: Text('User details')),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 26),
              CustomTextField(
                controller: userNameController,
                title: 'User name',
                hintText: 'Reham Mohamed',
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: userquoteController,
                title: 'Motivation Quote',
                hintText: 'One task at a time.One step  closer.',
                maxLines: 5,
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // SharedPreferences prefs=await SharedPreferences.getInstance();
                    // prefs.setString('userName', userNameController.text);
                    // prefs.setString('quote', userquoteController.text);
                    setUserDetails();
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  label: Text('Change user details'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
