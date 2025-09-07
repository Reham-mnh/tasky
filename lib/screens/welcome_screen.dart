import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/widgets/bottom_nav_bar_widget.dart';
import 'package:tasky/widgets/custom_text_field.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final _key = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/logo.svg', width: 42, height: 42),
                  Text(
                    'Tasky',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              SizedBox(height: 108),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To Tasky ',
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge?.copyWith(fontSize: 24),
                  ),
                  SvgPicture.asset('assets/hand.svg', width: 28, height: 28),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Your productivity journey starts here.',
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
              Center(child: SvgPicture.asset('assets/pana.svg')),
              SizedBox(height: 28),

              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      CustomTextField(
                        controller: nameController,
                        title: 'Full Name',
                        hintText: 'e.g. Sarah Khalid',
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 40,
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setString(
                              'userName',
                              nameController.text,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBarWidget(),
                              ),
                            );
                          },
                          child: Text('Let’s Get Started'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
