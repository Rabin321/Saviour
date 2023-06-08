import 'package:flutter/material.dart';
import 'package:saviour/lifesave_options/emergency.dart';
import 'package:saviour/lifesave_options/explorelive.dart';
import 'package:saviour/location/send_location.dart';
import 'package:saviour/widgets/customappbar.dart';
import 'package:saviour/widgets/customcarousel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  // int qIndex = 0;

  // getRandomQuote() {
  //   Random random = Random();

  //   setState(() {
  //     qIndex = random.nextInt(4);
  //   });
  // }

  // @override
  // void initState() {
  //   getRandomQuote();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 246, 248),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomAppBar(
                  // quoteIndex: qIndex,
                  // onTap: () {
                  //   getRandomQuote();
                  // },
                  ),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: const [
                  CustomCarousel(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      "Emergency",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Emergency(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Text(
                      "Explore Life Save",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                  ),
                  LiveSave(),
                  SendLocation(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
