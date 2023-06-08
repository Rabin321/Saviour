import 'package:flutter/material.dart';
import 'package:saviour/screens/login.dart';

class MenuItems {
  static const home = MenuItemharu('Home', Icons.home);
  static const help = MenuItemharu('Help', Icons.help);
  static const feedback = MenuItemharu('Feedback', Icons.feedback);
  static const invite = MenuItemharu('Invite friends', Icons.inventory);
  static const rate = MenuItemharu('Rate app', Icons.rate_review);
  static const aboutus = MenuItemharu('About us', Icons.info);
  static const settings = MenuItemharu('Settings', Icons.settings);

  static const all = <MenuItemharu>[
    home,
    help,
    feedback,
    invite,
    rate,
    aboutus,
    settings,
  ];
}

class MenuScreen extends StatelessWidget {
  final MenuItemharu currentItem;
  final ValueChanged<MenuItemharu> onSelectedItem;
  const MenuScreen(
      {super.key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 149, 142),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 19.0, top: 40, bottom: 50),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/image/police1.jpg'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rabin",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    "9876543210",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // menus
          // const Spacer(),
          ...MenuItems.all.map(buildMenuItem).toList(),

          // // dark mode on off
          // Row(
          //   children: [
          //     Switch(value: false, onChanged: (value) {}),
          //   ],
          // ),
          const Spacer(flex: 1),

          // Logout button
          Row(
            children: [
              InkWell(
                onTap: (() =>
                    // debugPrint("Logout clicked")

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()))),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 40),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 243, 241),
                        border: Border.all(
                            color: Color.fromARGB(255, 109, 107, 107),
                            width: 1.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                          child: Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildMenuItem(MenuItemharu item) => ListTile(
        selectedColor: Colors.white,
        selected: currentItem == item,
        minLeadingWidth: 25,

        iconColor: Colors.black,
        textColor: Colors.black,
        // selectedTileColor: Colors.blueGrey.shade100,
        leading: Icon(item.icon),
        title: Text(
          item.title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        onTap: () => onSelectedItem(item),
      );
}

class MenuItemharu {
  final String title;
  final IconData icon;

  const MenuItemharu(this.title, this.icon);
}
