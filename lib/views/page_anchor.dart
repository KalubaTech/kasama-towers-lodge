import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';
import 'package:kasama_towers_lodge/views/dashboard/dashboard.dart';
import 'package:kasama_towers_lodge/views/discover/rooms.dart';
import 'package:kasama_towers_lodge/views/profile/profile.dart';
import 'package:kasama_towers_lodge/views/search/search.dart';


class PageAnchor extends StatefulWidget {
  PageAnchor({super.key});

  @override
  State<PageAnchor> createState() => _PageAnchorState();
}

class _PageAnchorState extends State<PageAnchor> {
  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "Home",
      Karas.action,
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
    TabItem(
      Icons.search,
      "Search",
      Karas.action,
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
    TabItem(
      Icons.layers,
      "Rooms",
      Karas.action,
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
    TabItem(
      Icons.person,
      "Account",
      Karas.action,
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  ]);

  CircularBottomNavigationController _controller = CircularBottomNavigationController(0);
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Karas.primary,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        barBackgroundColor: Karas.primary,
        iconsSize: 24,
        circleSize: 50,
        controller: _controller,
        selectedCallback: (index) {
          _pageController.animateToPage(
            index!,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF06435A),
                    Color(0xFF0C729B),
                  ],
                  stops: [0.5, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar.webp'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Kaluba Chakanga',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'kalubachakanga@gmail.com',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _controller.value = index;
        },
        children: [
          Dashboard(),
          Search(),
          Rooms(),
          Profile(),
        ],
      ),
    );
  }
}

