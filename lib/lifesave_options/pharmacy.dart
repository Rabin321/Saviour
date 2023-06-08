// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pharmacy extends StatelessWidget {
  final Function? onMapFunction;
  const Pharmacy({
    Key? key,
    this.onMapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 7.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Pharmacies near me');
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
                    "assets/image/pharmacylogo.jpg",
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
            "Pharmacy",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
