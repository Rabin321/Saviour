import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:saviour/drawer/screens/menuscreen.dart';
import 'package:saviour/screens/home.dart';

class BeforeHomeDrawer extends StatefulWidget {
  const BeforeHomeDrawer({super.key});

  @override
  State<BeforeHomeDrawer> createState() => _BeforeHomeDrawerState();
}

class _BeforeHomeDrawerState extends State<BeforeHomeDrawer> {
  MenuItemharu currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 40,
      style: DrawerStyle.defaultStyle,
      // moveMenuScreen: false,
      showShadow: true,
      drawerShadowsBackgroundColor: Color.fromARGB(255, 59, 89, 104),
      menuBackgroundColor: Color.fromARGB(255, 158, 149, 142),

      mainScreenTapClose: true,
      // shadowLayer1Color: Color.fromARGB(255, 189, 192, 192),
      // shadowLayer2Color: Color.fromARGB(255, 148, 153, 155),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade700,
          blurRadius: 20,
          spreadRadius: 5,
        ),
      ],

      // menuScreenTapClose: true,
      androidCloseOnBackTap: true,
      menuScreenWidth: MediaQuery.of(context).size.width * 0.46,
      mainScreenScale: 0.2,
      angle: 0,
      dragOffset: 70,

      slideWidth: MediaQuery.of(context).size.width * 0.54,
      //drawerShadowsBackgroundColor: Colors.white,
      //  mainScreen: const Home(),
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => MenuScreen(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        ),
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const Home();
      case MenuItems.help:
        return const Home();
      case MenuItems.feedback:
        return const Home();
      case MenuItems.invite:
        return const Home();
      case MenuItems.rate:
        return const Home();
      case MenuItems.aboutus:
        return const Home();
      case MenuItems.settings:
        return const Home();

      default:
        return const Home();
    }
  }
}
