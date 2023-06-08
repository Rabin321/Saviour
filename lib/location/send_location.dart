import 'package:flutter/material.dart';

class SendLocation extends StatelessWidget {
  const SendLocation({super.key});

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
