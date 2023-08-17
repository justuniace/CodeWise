import 'package:flutter/material.dart';
import 'package:codewise/screens/compiler/compiler.dart';
import 'package:codewise/screens/lessons/lesson.dart';
import 'package:codewise/screens/user/user.dart';
import 'package:codewise/theme.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = const [CodeEditor(), Lesson(), UserProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.lightPeachColor,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.lightGrayColor,
        selectedItemColor: AppColor.deepBlueColor,
        unselectedFontSize: 9,
        selectedFontSize: 12,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.code_rounded),
            label: 'Compiler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Lesson',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
