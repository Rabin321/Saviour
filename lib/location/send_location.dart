import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saviour/location/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SendLocation extends StatefulWidget {
  const SendLocation({super.key});

  @override
  State<SendLocation> createState() => _SendLocationState();
}

class _SendLocationState extends State<SendLocation> {
  late String lat;
  late String long;

  String messageloc = 'Sample location';

  SendlocationContactBox(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Card(

                  //color: Color.fromARGB(255, 217, 230, 236),
                  ));
        });
  }

  Future<Position> _getlocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    print(position);

    print(position.accuracy);

    bool serviceEnabled;
    LocationPermission permission;

// test if location service service are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted

    return await Geolocator.getCurrentPosition();
  }

  // listen to location update
  void _livelocation() {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String mapurl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    await canLaunchUrlString(mapurl)
        ? launchUrlString(mapurl)
        : throw 'Could not open the map $mapurl';
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SendlocationContactBox(context),
      child: Card(
        //color: Colors.red,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 3),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: ClipRRect(
                          child: Image.asset(
                        "assets/image/sendlocation.png",
                      )),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Send Location to your loved ones.",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    // subtitle: Text("Share location with your loved ones"),
                  )
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 5, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 28, 168, 33))),
                      onPressed: () {},
                      child: const Text(
                        "Send Location",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(messageloc),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 28, 42, 168))),
                      onPressed: () {
                        _getlocation().then((value) {
                          lat = '${value.latitude}';
                          long = '${value.longitude}';

                          setState(() {
                            messageloc = 'Latitude: $lat , Longitude: $long';
                            print(messageloc);
                          });
                          _livelocation();
                        });
                      },
                      child: const Text(
                        "Get my location",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 28, 42, 168))),
                      onPressed: () {
                        _openMap(lat, long);
                      },
                      child: const Text(
                        "Open Map",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
