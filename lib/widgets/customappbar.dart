// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:saviour/drawer/screens/menuscreen.dart';

class CustomAppBar extends StatelessWidget {
  Function? onTap;
  int? quoteIndex;
  CustomAppBar({
    Key? key,
    this.onTap,
    this.quoteIndex,
  }) : super(key: key);

  // const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var datenow = NepaliDateFormat.yMMMMEEEEd();
    var timenow = NepaliDateFormat.jm();
    var currentdate = NepaliDateTime.now();
    return Container(
      //  color: Colors.blueGrey,
      //  height: MediaQuery.of(context).size.height * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                // onPressed: () => ZoomDrawer.of(context)!.toggle(),
                onPressed: () {
                  final zoomDrawer = ZoomDrawer.of(context);
                  if (zoomDrawer != null) {
                    zoomDrawer.toggle();
                  }
                },

                //   // Navigator.push(context,
                //   //     MaterialPageRoute(builder: (context) => MenuItems()));
                // },

                icon: const Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  // datenow.format('EEEE, MMMM d, y'),
                  datenow.format(currentdate),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  timenow.format(currentdate),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
