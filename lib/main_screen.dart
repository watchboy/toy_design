import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:untitled/chat_screen.dart';
import 'package:untitled/data_tab_screen.dart';
import 'package:untitled/hometab_screen.dart';
import 'package:untitled/screen_size.dart';
import 'package:untitled/story_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color barBackgroundColor = const Color(0xff8BBDFF);
  final Duration animDuration = const Duration(milliseconds: 250);

  //final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);
  List<String> btnImageNameList = {
    'assets/btn_heart.png',
    'assets/cate_04_on.png',
    'assets/cate_09_on.png',
    'assets/cate_10_on.png'
  }.toList();
  List<String> btnNameList = {'우리의 흔적', '일정', '커플마트', '설정'}.toList();

  int touchedIndex = -1;

  bool isPlaying = false;
  bool isOpened = false;
  int currentIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Position? currentPosition;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _key,
        extendBody: false,
        body: IndexedStack(
          index: currentIndex,
          children: [
            HomeTabScreen(),
            DateTabScreen(),
            ChatScreen(),
            StoryScreen(),
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: buildBottomNavigationBar(),
              flex: 1,
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom, right: 16),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showModalBottomSheet(
                        useRootNavigator: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            width: size!.width,
                            height: size!.height*0.35,
                            color: Colors.white54,
                            alignment: Alignment.center,
                            child: Text('ㅇㅇㅇ'),
                          );
                        });
                  },
                )),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        currentIndex: currentIndex,
        onTap: onBtnItemClick,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          homeNaviButton(),
          dateNaviButton(),
          chatNaviButton(),
          storyNaviButton(),
        ]);
  }

  void onBtnItemClick(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  BottomNavigationBarItem addNaviButton() {
    return BottomNavigationBarItem(
        icon: Icon(Icons.add, size: 20), label: ('더 보기'));
  }

  BottomNavigationBarItem storyNaviButton() {
    return BottomNavigationBarItem(
        icon: Icon(Icons.photo_library_outlined, size: 20), label: ('스토리'));
  }

  BottomNavigationBarItem chatNaviButton() {
    return BottomNavigationBarItem(
      label: ('채팅'),
      icon: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              IconButton(
                icon: Icon(Icons.chat,size: 20,),
                onPressed: () {
                  Get.to(()=>ChatScreen());
                },
              ),
              Positioned(
                right: -10.0,
                top: -10.0,
                child: Badge(
                  position: BadgePosition.topEnd(),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem dateNaviButton() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.map, size: 20),
      label: ('데이트'),
    );
  }

  BottomNavigationBarItem homeNaviButton() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 20),
      label: ('홈'),
      backgroundColor: Colors.black,
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 100));
    if (isPlaying) {
      await refreshState();
    }
  }
}
