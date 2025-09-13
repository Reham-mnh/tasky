import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/app_color/app_color_dark.dart';
import 'package:tasky/app_color/app_color_light.dart';
import 'package:tasky/controller/cubit/theme/theme_cubit.dart';
import 'package:tasky/screens/user_details_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '';
  String quote = '';
  File? image;
  final imagePicker = ImagePicker();
  uploadImage() async {
    var pickedImaged = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImaged != null) {
      setState(() {
        image = File(pickedImaged.path);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('User_picture', pickedImaged.path);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      quote = prefs.getString('quote') ?? '';
      var path = prefs.getString('User_picture');
      if (path != null) {
        image = File(path);
      }
    });
  }

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
                    radius: 85,
                    backgroundImage:
                        image == null
                            ? AssetImage("assets/profilePicture.png")
                            : FileImage(image!),
                  ),
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                    ),

                    child: IconButton(
                      onPressed: uploadImage,
                      icon: SvgPicture.asset(
                        'assets/camera-01.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(userName, style: Theme.of(context).textTheme.displayLarge),
              Text(quote, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: 20),

              Row(
                children: [
                  Text(
                    'Profile info',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              ListTile(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsScreen(),
                    ),
                  );

                  if (result == true) {
                    getUserData();
                  }
                },
                leading: SvgPicture.asset(
                  'assets/profiles.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  'User Details',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              Divider(indent: 20, endIndent: 20),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/moon.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  'Dark mode',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                trailing: BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, themeMode) {
                    return Switch(
                      activeColor: AppColorDark.mainColor,
                      value: themeMode == ThemeMode.dark,
                      thumbColor: WidgetStatePropertyAll(
                        AppColorLight.appColor,
                      ),
                      onChanged: (value) {
                        context.read<ThemeCubit>().selectedTheme();
                      },
                    );
                  },
                ),
              ),
              Divider(indent: 20, endIndent: 20),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/logout.svg',
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  'Log Out',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
