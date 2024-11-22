import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasama_towers_lodge/components/kalubtn.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';
import 'package:kasama_towers_lodge/views/dashboard/dashboard.dart';
import 'package:kasama_towers_lodge/views/discover/rooms.dart';
import 'package:kasama_towers_lodge/views/profile/profile.dart';
import 'package:kasama_towers_lodge/views/reservation/reserved.dart';
import 'package:kasama_towers_lodge/views/search/search.dart';
import 'package:get/get.dart';
import 'package:kasama_towers_lodge/views/signin/sign_in.dart';
import '../components/drawer_tile.dart';
import '../controllers/user_controller.dart';


class PageAnchor extends StatefulWidget {
  PageAnchor({super.key});

  @override
  State<PageAnchor> createState() => _PageAnchorState();
}

class _PageAnchorState extends State<PageAnchor> {


  List<IconData> iconList = List.of([
    Icons.home,
    Icons.search,
    Icons.layers,
    Icons.person,
  ]);

  CircularBottomNavigationController _controller = CircularBottomNavigationController(0);
  PageController _pageController = PageController();

  int _bottomNavIndex = 0;

  UserController _userController = Get.find();

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.access_time_filled),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        activeColor: Karas.action,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => (_bottomNavIndex = index, _pageController.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.ease))),
        //other params
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
                    Karas.primary,
                    Karas.primary.withOpacity(0.7),
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
                    '${_userController.user.first.fullname}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '${_userController.user.first.email}',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    DrawerTile(
                      title: 'Rooms',
                      icon: Icons.meeting_room_outlined,
                      onclick: (){

                      },
                    ),
                    DrawerTile(
                      title: 'Reserved',
                      icon: Icons.warehouse,
                      onclick: (){
                        Get.to(()=>Reserved());
                      },
                    ),
                    Spacer(),
                    Divider(
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Kalubtn(
                          width: 100,
                            label: 'Logout', onclick: (){
                          Get.offAll(()=>SignIn());
                        }),
                      ],
                    ),
                    SizedBox(height: 20,)

                  ],
                ),
              ),
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

