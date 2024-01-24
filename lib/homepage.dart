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
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          body: Column(
            children: [
              const HeaderWidget(),
              // const SizedBox(height: 8),
              Expanded(child: _pages.elementAt(_selectedIndex)),
            ],
          ),
          bottomNavigationBar: Container(
            height: 60,
            child: BottomNavigationBar(
              selectedItemColor: primaryColor,
              unselectedItemColor: inActivateTextColor,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              iconSize: 18,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              showUnselectedLabels: true,
              currentIndex: _selectedIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.arrowtriangle_right_square_fill), label: 'Works'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.bookmark), label: 'About'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.info), label: 'Members'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.at), label: 'Contact')
              ],
            ),
          )),
    );
  }
}
