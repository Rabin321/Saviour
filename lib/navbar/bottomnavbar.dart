import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:saviour/constants/allconstants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override

  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        // key: _bottomNavigationKey,
        // index: 0,

        height: 50.0,
        items: const <Widget>[
          Icon(Icons.home, size: 25),
          Icon(Icons.contact_phone_rounded, size: 25),
          Icon(Icons.account_circle, size: 25),
          Icon(Icons.menu, size: 25),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.blueGrey[200]!,
        buttonBackgroundColor: Colors.orange,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: changePage,
        // letIndexChange: (index) => true,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screens,
      ),
    );
  }
}
