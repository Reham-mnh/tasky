import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/app_color/app_color_dark.dart';
import 'package:tasky/app_color/app_color_light.dart';
import 'package:tasky/screens/user_details_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '';
  String quote = '';
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
              Text(userName, style: Theme.of(context).textTheme.displayLarge),
              Text(quote, style: Theme.of(context).textTheme.displaySmall),
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
                trailing: IconButton(
                  onPressed: ()async {
                   await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsScreen(),
                      ),
                      
                    );
                    getUserData();
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
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
                trailing: Switch(
                  activeColor: AppColorDark.mainColor,
                  value:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
                  thumbColor: WidgetStatePropertyAll(AppColorLight.appColor),
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
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
