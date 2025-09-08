import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/app_color/app_color_dark.dart';
import 'package:tasky/app_color/app_color_light.dart';
import 'package:tasky/screens/user_details_screen.dart';

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
              ListTile(
                leading: SvgPicture.asset('assets/profiles.svg'),
                title: Text('User Details'),
                trailing: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailsScreen()));
                }, icon: Icon(Icons.arrow_forward)),
              )
//               Switch(
//                 activeColor: AppColorDark.mainColor,
//                 thumbColor: WidgetStatePropertyAll(AppColorLight.appColor),
//   value: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
//   onChanged: (isDark) {
//     if (isDark) {
//       AdaptiveTheme.of(context).setDark();
//     } else {
//       AdaptiveTheme.of(context).setLight();
//     }
//   },
// ),
            ],
          ),
        ),
      ),
    );
  }
}
