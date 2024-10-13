import 'package:flutter/material.dart';

import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/icons/appLogo.png",
            height: 80,
          ),
          const Text(
            "Selamat Datang!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(width: 24),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.login, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
