import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.only(top: 26.0),
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/adam.jpg'),
                  ),
                  Container(
                    height: 40,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),

                    child: Center(child: Icon(Icons.camera_alt)),
                  ),
                ],
              ),
              Text("data", style: Theme.of(context).textTheme.displayLarge),
              Text('data', style: Theme.of(context).textTheme.displaySmall),
              SizedBox(height: 20,),

              Row(
                children: [
                  Text(
                    'Profile info',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
