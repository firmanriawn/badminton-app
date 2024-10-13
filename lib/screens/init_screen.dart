import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/riwayat/riwayat_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const HomeScreen(),
    RiwayatScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24, // Atur lebar ikon
              height: 24, // Atur tinggi ikon
              child: Image.asset(
                "assets/icons/menu home.png",
                color: inActiveIconColor,
              ),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                "assets/icons/menu home.png",
                color: const Color(0xFF142f47),
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                "assets/icons/menu riwayat.png",
                color: inActiveIconColor,
              ),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                "assets/icons/menu riwayat.png",
                color: const Color(0xFF142f47),
              ),
            ),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                "assets/icons/menu profile.png",
                color: inActiveIconColor,
              ),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                "assets/icons/menu profile.png",
                color: const Color(0xFF142f47),
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
