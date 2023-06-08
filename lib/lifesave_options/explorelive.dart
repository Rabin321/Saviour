import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saviour/lifesave_options/busstation.dart';
import 'package:saviour/lifesave_options/hospitals.dart';
import 'package:saviour/lifesave_options/maitinepal.dart';
import 'package:saviour/lifesave_options/pharmacy.dart';
import 'package:saviour/lifesave_options/police.dart';
import 'package:saviour/lifesave_options/traffic.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveSave extends StatelessWidget {
  const LiveSave({super.key});

  // open google map when user click on options of explore live

  // static Future<void> openMap(double lat, double long) async {
  //   String googleUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  //   if (await canLaunch(googleUrl)) {
  //     await launch(googleUrl);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';

    final Uri url = Uri.parse(googleUrl);
    try {
      await launchUrl(url);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          PoliceStation(
            onMapFunction: openMap,
          ),
          Hospital(
            onMapFunction: openMap,
          ),
          BusStation(
            onMapFunction: openMap,
          ),
          Pharmacy(
            onMapFunction: openMap,
          ),
          MaaitiNepal(
            onMapFunction: openMap,
          ),
          TrafficPolice(
            onMapFunction: openMap,
          ),
        ],
      ),
    );
  }
}
