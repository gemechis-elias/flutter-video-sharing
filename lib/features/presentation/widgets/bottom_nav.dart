import 'package:flutter/material.dart';

BottomNavigationBar bottomNav() {
  return BottomNavigationBar(
    backgroundColor: const Color(0xff2E2E2E),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: const Color(0xffFFDD5E),
    unselectedItemColor: Colors.grey,
    currentIndex: 0,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/home.png',
          width: 24,
          height: 24,
        ),
        label: "Apps",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/chat.png',
          width: 24,
          height: 24,
        ),
        label: "Qucon",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/robot.png',
          width: 24,
          height: 24,
        ),
        label: "Zaady",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/message.png',
          width: 24,
          height: 24,
        ),
        label: "Organize",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/Vector.png',
          width: 24,
          height: 24,
        ),
        label: "Profile",
      )
    ],
  );
}
