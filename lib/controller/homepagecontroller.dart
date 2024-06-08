import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_admin/view/favorite.dart';
import 'package:super_admin/view/home.dart';
import 'package:super_admin/view/search.dart';
import 'package:super_admin/view/profile.dart';

class HomepageController extends GetxController {
  ScrollController scroller = ScrollController();
  double slidervaluestart = 0.0;

  List<BottomNavigationBarItem> bottomBarItems() {
    return [
      BottomNavigationBarItem(
        label: 'Search',
        icon: const Icon(Icons.search, color: Colors.white),
      ),
      BottomNavigationBarItem(
        label: 'Favorites',
        icon: const Icon(Icons.favorite, color: Colors.white),
      ),
      BottomNavigationBarItem(
        label: 'Settings',
        icon: const Icon(Icons.settings, color: Colors.white),
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: const Icon(Icons.person, color: Colors.white),
      ),
    ];
  }

  int current_index = 0;

  List<Widget> screens = [Home(), Favorite(), Search(), Profile()];
}
