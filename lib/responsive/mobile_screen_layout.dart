import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:purple/models/user.dart' as model;
import 'package:purple/providers/user_provider.dart';
import 'package:purple/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.house_fill,
              color: (_page == 0) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: mobileSearchColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.search,
              color: (_page == 1) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: mobileSearchColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.plus_rectangle_fill_on_rectangle_fill,
              color: (_page == 2) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: mobileSearchColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.square_favorites_alt_fill,
              color: (_page == 3) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: mobileSearchColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_fill,
              color: (_page == 4) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: mobileSearchColor,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
