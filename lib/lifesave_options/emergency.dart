import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:saviour/drawer/screens/samplepolice.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
// // for calling police(no use)
//   final TextEditingController _policenoCtrl = TextEditingController();
//   final TextEditingController _ambulancenoCtrl = TextEditingController();
//   final TextEditingController firebrigadenoCtrl = TextEditingController();
// //  final TextEditingController _policenoCtrl = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _policenoCtrl.text = "100";
//     _ambulancenoCtrl = "54678";
//     firebrigadenoCtrl = "";
//   }

// for calling police
  // _callPolice(String number) async {
  //   // const number = '100'; //set the number
  //   await FlutterPhoneDirectCaller.callNumber(number);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 210,
      // height: MediaQuery.of(context).size.height/0.02,
      child: Expanded(
        // flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              // Police(),
              // Ambulance(),
              EmergencyBox(
                'assets/image/police1.jpg',
                'Nepal Police',
                '100',
                () => FlutterPhoneDirectCaller.callNumber('1234'),
              ),
              const SizedBox(
                width: 5,
              ),

              EmergencyBox(
                'assets/image/firebrigade.jpg',
                'Fire Brigade',
                '101',
                () => const SamplePolice(),
              ),
              const SizedBox(
                width: 5,
              ),

              EmergencyBox(
                'assets/image/ambulance.png',
                'Ambulance',
                '102',
                () => const SamplePolice(),
              ),
              const SizedBox(
                width: 5,
              ),

              EmergencyBox(
                'assets/image/traffic1.jpg',
                'Traffic Police',
                '103',
                () => const SamplePolice(),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// emergency boxes

class EmergencyBox extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  final Function ontapfunction;

  const EmergencyBox(this.image, this.title, this.subtitle, this.ontapfunction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: () {
    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //       return ontapfunction();
    //     }));
    //   },
    //   child:
    return Container(
      // padding: EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(right: 16, top: 8, bottom: 18),
      width: MediaQuery.of(context).size.width * 0.33,
      // height: MediaQuery.of(context).size.width * 0.3,

      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(17), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          blurRadius: 3,
          spreadRadius: 2,
        ),
      ]),
      child: Column(
        children: [
          Expanded(
              flex: 9,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
              )),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(subtitle,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo)),
                    const Row(
                      children: [
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
              margin:
                  const EdgeInsets.only(left: 8, right: 0, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                    )
                  ]),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ontapfunction();
                  }));
                },
                child: const Row(
                  children: [
                    Center(
                      child: RotatedBox(
                        quarterTurns: 4,
                        child: Text(
                          "Call now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
