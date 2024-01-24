import 'package:ams/about/about_screen.dart';
import 'package:ams/common/color.dart';
import 'package:ams/common/header.dart';
import 'package:ams/works/work_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WorkPage(),
    const AboutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Column(
            children: [
              const HeaderWidget(),
              // const SizedBox(height: 8),
              Expanded(child: _pages.elementAt(_selectedIndex)),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: brandColor,
          // unselectedItemColor: inActivateTextColor,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 10),
          iconSize: 16,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.arrowtriangle_right_square_fill),
                icon: Icon(CupertinoIcons.arrowtriangle_right_square),
                label: 'Works'),
            BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.bookmark_fill), icon: Icon(CupertinoIcons.bookmark), label: 'About'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.info), label: 'Members'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.at), label: 'Contact')
          ],
        ));
  }
}
