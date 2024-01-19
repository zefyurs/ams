import 'package:ams/about/about_screen.dart';
import 'package:ams/const/color.dart';
import 'package:ams/contact/contact_screen.dart';
import 'package:ams/member/member_screen.dart';
import 'package:ams/works/work_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabController.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = tabController.index;
    });
  }

  @override
  void dispose() {
    tabController.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const <Widget>[AboutPage(), WorkPage(), MemberPage(), ContactPage()],
        )),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: inActivateTextColor,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          iconSize: 18,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            tabController.animateTo(index);
          },
          currentIndex: index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.building_2_fill), label: 'About'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.film), label: 'Works'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.group_solid), label: 'Members'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone_solid), label: 'Contact')
          ],
        ));
  }
}
