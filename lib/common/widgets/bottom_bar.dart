import 'package:a_s_c/features/accounts/screens/account_screen.dart';
import 'package:a_s_c/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-bar';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 38;
  double bottomBarContainerWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('CARTS'),),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Colors.deepPurple,
        elevation: 4,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //HOMEPAGE
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0 ? Colors.deepPurple : Colors.white,
                    width: bottomBarContainerWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_rounded),
            ),
          ),
          //PROFILE OR ACCOUNT
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1 ? Colors.deepPurple : Colors.white,
                width: bottomBarContainerWidth,
              ))),
              child: const Icon(Icons.person),
            ),
          ),
          //THE CART
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 2 ? Colors.deepPurple : Colors.white,
                width: bottomBarContainerWidth,
              ))),
              child:  badges.Badge(
                  badgeContent:  Text(
                    '7',
                    style: TextStyle(
                      color: _page ==2 ? Colors.white: Colors.deepPurple,
                    ),
                  ),
                  badgeStyle: badges.BadgeStyle(
                    elevation: 0,
                    badgeColor: _page == 2? Colors.deepPurple : Colors.white,                    
                  ),
                  child: const Icon(Icons.shopping_cart_rounded)),
            ),
          ),
        ],
      ),
    );
  }
}
