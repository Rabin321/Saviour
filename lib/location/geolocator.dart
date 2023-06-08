import 'package:flutter/material.dart';

class GeoLocatorSend extends StatefulWidget {
  const GeoLocatorSend({super.key});

  @override
  State<GeoLocatorSend> createState() => _GeoLocatorSendState();
}

class _GeoLocatorSendState extends State<GeoLocatorSend> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("geo"),
      ),
    );
  }
}
