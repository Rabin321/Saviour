// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Hospital extends StatelessWidget {
  final Function? onMapFunction;
  const Hospital({
    Key? key,
    this.onMapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 12.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Hospitals near me');
            },
            child: Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 60,
                width: 60,
                child: Center(
                  child: Image.asset(
                    "assets/image/hospitallogo2.jpg",
                    height: 45,
                    width: 45,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Hospital",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
