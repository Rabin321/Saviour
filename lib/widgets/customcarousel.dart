import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:saviour/utils/quotes.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  // void navigateToRoute(BuildContext context, Widget route) {
  //   Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: List.generate(
          imageSliders.length,
          (index) => Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                //   if (index == 0) {
                //     navigateToRoute(
                //         context,
                //         const CarouseltowebView(
                //           url:
                //               'https://nepal.oxfam.org/what-we-do-sustainable-development-programme/women-empowerment-programme',
                //         ));
                //   } else if (index == 1) {
                //     navigateToRoute(
                //         context,
                //         const CarouseltowebView(
                //           url:
                //               'https://nepal.oxfam.org/what-we-do-sustainable-development-programme/women-empowerment-programme',
                //         ));
                //   } else if (index == 2) {
                //     navigateToRoute(
                //         context,
                //         const CarouseltowebView(
                //           url:
                //               'https://nepal.oxfam.org/what-we-do-sustainable-development-programme/women-empowerment-programme',
                //         ));
                //   } else {
                //     navigateToRoute(
                //         context,
                //         // const CarouseltowebView(
                //         //   url:
                //         //       'https://nepal.oxfam.org/what-we-do-sustainable-development-programme/women-empowerment-programme',
                //         // ),
                //         );
                //   }
                // },

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          imageSliders[index],
                        ),
                        fit: BoxFit.cover,
                      )),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        articleTitle[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
