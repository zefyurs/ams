import 'package:ams/about/about_screen.dart';
import 'package:ams/const/color.dart';
import 'package:ams/const/consonents.dart';
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

  List<Widget> subPages = [buildListScreen(), buildAboutUsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(slivers: <Widget>[
        _buildHeader(),
        _topmenu(),

        SliverToBoxAdapter(child: subPages[index]),
        // SizedBox(height: widgetDistanceMiddle),
        // Expanded(
        //   child: ListView(
        //     children: [
        //       WorkPage(),
        //     ],
        //   ),
        // ),
      ]),
    );
    // bottomNavigationBar: Container(
    //   height: 60,
    //   child: BottomNavigationBar(
    //     selectedItemColor: primaryColor,
    //     unselectedItemColor: inActivateTextColor,
    //     selectedFontSize: 12,
    //     unselectedFontSize: 12,
    //     iconSize: 18,
    //     type: BottomNavigationBarType.fixed,
    //     onTap: (int index) {
    //       tabController.animateTo(index);
    //     },
    //     showUnselectedLabels: true,
    //     currentIndex: index,
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(icon: Icon(CupertinoIcons.film), label: 'Works'),
    //       BottomNavigationBarItem(icon: Icon(CupertinoIcons.building_2_fill), label: 'About'),
    //       BottomNavigationBarItem(icon: Icon(CupertinoIcons.group_solid), label: 'Members'),
    //       BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone_solid), label: 'Contact')
    //     ],
    //   ),
    // )
  }

  SliverAppBar _topmenu() {
    return SliverAppBar(
      surfaceTintColor: bgColor,
      backgroundColor: bgColor,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
          child: Row(
            children: [
              const Text(
                'Works',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1.0),
              ),
              const SizedBox(width: 15),
              Text(
                'About us',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.0),
              ),
              const SizedBox(width: 15),
              Text(
                'Contact',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

SliverPadding _buildHeader() {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
    sliver: SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              // * AMS 로고
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text('AMS',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white, letterSpacing: -0.5)),
                  ),
                  const Text('IAMSUPER', style: TextStyle(fontSize: 8, height: 1))
                ],
              ),
              const SizedBox(width: 6),
              // * AMS full 로고
              Expanded(
                  child: Text('Active Moment Studio',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade800,
                          letterSpacing: -2.0))),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search, color: Colors.grey.shade700))
            ],
          ),
        ],
      ),
    ),
  );
}
