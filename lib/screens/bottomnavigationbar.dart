import 'package:eas/colors.dart';
import 'package:eas/screens/homepage.dart';
import 'package:eas/screens/profilepage.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

List<Widget> pages = const [Home(), Profile()];
int selectedIndex = 0;

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: MyColors.mainColor,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        onTap: (value) => {
          setState(() {
            selectedIndex = value;
          })
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
