import 'package:a_s_c/features/admin/screens/posts_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 38;
  double bottomBarContainerWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text('Analytics Page'),
    ),
    const Center(
      child: Text('CARTS'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18)),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 45,
                  ),
                ),
                const Text(
                  'Admin',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
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
          //POSTS
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
              child: const Icon(
                Icons.home_max_rounded,
              ),
            ),
          ),
          //Analytics
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
              child: const Icon(
                Icons.analytics_rounded,
              ),
            ),
          ),
          //ORDERS
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
              child: const Icon(
                Icons.all_inbox_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
