import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  void initState() {
    super.initState();

    getUserName();
  }

  String userName = '';

  getUserName() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      userName = preferences.getString('userName') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      toolbarHeight: 100,
      leading: SvgPicture.asset(
        'assets/man.svg',
        width: 42,
        height: 42,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Evening ,$userName',
                  style: Theme.of(context).textTheme.displayMedium,
                ),

                Text(
                  "One task at a time.One step \n closer.",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/sun.svg',
                width: 15,
                height: 15,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
