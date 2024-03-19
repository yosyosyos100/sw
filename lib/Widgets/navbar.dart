import 'package:flutter/material.dart';
import 'package:jobspot/Screens/Ecom.dart';
import 'package:jobspot/Screens/Login.dart';
import 'package:jobspot/Screens/ProfileEdit.dart';
import 'package:jobspot/Screens/user.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

@override
class _NavBarState extends State<NavBar> {
  late SharedPreferences pref;
  late String username = "";
  String profilepic = "";
  Future <void>dud() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username').toString();
      profilepic = pref.getString('profilepic').toString();
    });
  }

  Future logout() async {
    await User.setsignin(false);
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dud();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
                "http://10.0.2.2/flutter_login/uploads/1000000034.jpg"),
          ),
          SizedBox(
            child: Text(profilepic),
            
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: Text(username),
            
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Account"),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: ProfilePage()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("ffff"),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const Ecom()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.headset_mic_rounded),
                    title: const Text("Support"),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(children: [
              ListTile(
                title: const Text(
                  "Sign Out",
                  textAlign: TextAlign.end,
                ),
                trailing: const Icon(Icons.subdirectory_arrow_right_sharp),
                onTap: () {
                  logout();
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}