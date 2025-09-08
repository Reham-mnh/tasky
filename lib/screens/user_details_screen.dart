import 'package:flutter/material.dart';
import 'package:tasky/widgets/custom_text_field.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final  userNameController=TextEditingController();
     final  userDescriptionController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
       
      ),

      body:SafeArea(
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
                    controller: userDescriptionController,
                    title: 'Motivation Quote',
                    hintText:
                        'One task at a time.One step  closer.',
                    maxLines: 5,
                  ),
                 Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {}, label: Text('Change user details'),
                        )
                  )
                  
                ]
              )
            )
            )
    );
  }
}