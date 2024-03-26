import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/favorite_page.dart';
import 'package:naffith/presentation/screens/settings_page/settings_page.dart';
import '../../home_page/home_page.dart';
import '../../my_advertisements/my_advertisements.dart';
import '../../my_orders/my_orders_page.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    MyAdvertisements(),
    const MyOrdersPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: "الرئسية",
      icon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.home_filled,
          size: 20.h,
        ),
      ),
      activeIcon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.home_filled,
          color: const Color.fromRGBO(23, 56, 61, 1),
          size: 20.h,
        ),
      )),
  BottomNavigationBarItem(
      label: "إعلان",
      icon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.add,
          size: 20.h,
        ),
      ),
      activeIcon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.add,
          color: const Color.fromRGBO(23, 56, 61, 1),
          size: 20.h,
        ),
      )),
  BottomNavigationBarItem(
      label: "الطلبات",
      icon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.card_travel_outlined,
          size: 20.h,
        ),
      ),
      activeIcon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.card_travel_sharp,
          color: const Color.fromRGBO(23, 56, 61, 1),
          size: 20.h,
        ),
      )),
  BottomNavigationBarItem(
      label: "الفضلة",
      icon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.favorite_border,
          size: 20.h,
        ),
      ),
      activeIcon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Icon(
          Icons.favorite,
          color: const Color.fromRGBO(23, 56, 61, 1),
          size: 20.h,
        ),
      )),
  BottomNavigationBarItem(
    label: "الإعدادات",
    icon: SizedBox(
      width: 20.h,
      height: 20.h,
      child: Icon(
        Icons.settings_outlined,
        size: 20.h,
      ),
    ),
    activeIcon: SizedBox(
      width: 20.h,
      height: 20.h,
      child: Icon(
        Icons.settings_outlined,
        color: const Color.fromRGBO(23, 56, 61, 1),
        size: 20.h,
      ),
    ),
  ),
];
