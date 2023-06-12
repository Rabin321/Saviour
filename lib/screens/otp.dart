import 'dart:async';

import 'package:animate_do/animate_do.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saviour/screens/login.dart';

// class OtpScreen extends StatelessWidget {
//   const OtpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white,
//       //   title: const Text(
//       //     "Verify your phone number",
//       //     style: TextStyle(color: Colors.black),
//       //   ),
//       // ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               children: [
//                 FadeInDown(
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 50),
//                     child: Text(
//                       "Verify your phone number",
//                       style: TextStyle(
//                           letterSpacing: 1.2,
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 FadeInDown(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     child: Text(
//                       "Enter 4 digit code sent to your phone number",
//                       style: TextStyle(
//                           letterSpacing: 0.3,
//                           fontSize: 19,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey.shade900),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "This code will expire in ",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     TweenAnimationBuilder(
//                       tween: Tween(begin: 30.0, end: 0.0),
//                       duration: const Duration(seconds: 30),
//                       builder: (context, value, child) => Text(
//                         "00:${value} seconds",
//                         style: const TextStyle(color: Colors.red, fontSize: 16),
//                       ),
//                       onEnd: () {},
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();

  bool otpVisibility = false;
  // String? _verificationIDReceived;

  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var code = '';
    var phone = '';
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          //   height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height / 3,
                //   child: Image(
                //     image: const AssetImage("assets/images/otpverification.png"),
                //     fit: BoxFit.cover,
                //     width: size.width * 0.7,
                //     // alignment: Alignment.center,
                //   ),
                // ),

                Image.asset(
                  "assets/image/otpverification.png",
                  width: size.width * 0.7,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 50),

                FadeInDown(
                  child: const Text(
                    'Phone Number Verification',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        letterSpacing: 1.2,
                        color: Colors.black),
                    // textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                FadeInDown(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Enter code sent to + ${phoneNumberController.text}",
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  child: Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 5),
                        child: PinCodeTextField(
                          onChanged: (value) {
                            // setState(() {
                            //   currentText = value;
                            // });
                            code = value;
                          },
                          appContext: context,
                          length: 6,
                          cursorWidth: 1,
                          // obscureText: false,
                          // obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            borderWidth: 1.2,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 60,
                            fieldWidth: 50,
                            selectedColor: Colors.black,
                            selectedFillColor: Colors.white,
                            inactiveColor: Colors.black,
                            inactiveFillColor:
                                const Color.fromARGB(255, 241, 238, 238),
                            activeFillColor:
                                hasError ? Colors.green : Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          textStyle: const TextStyle(fontSize: 20, height: 1.6),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: otpCodeController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black26,
                              blurRadius: 5,
                            )
                          ],
                        )),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                //   child: Text(
                //     hasError ? "*Please fill up all the cells properly" : "",
                //     style: const TextStyle(
                //         color: Colors.red,
                //         fontSize: 12,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                FadeInDown(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Didn't receive the code? ",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4),
                        children: [
                          TextSpan(
                            text: " RESEND",
                            recognizer: onTapRecognizer,
                            style: const TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInDown(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "This code will expire in ",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        TweenAnimationBuilder(
                          tween: Tween(begin: 30.0, end: 0.0),
                          duration: const Duration(seconds: 30),
                          builder: (context, value, child) => Text(
                            "$value seconds",

                            // "${value} seconds", changed to "$value seconds"

                            style: const TextStyle(
                                color: Colors.red, fontSize: 16),
                          ),
                          onEnd: () {},
                        )
                      ],
                    )
                  ],
                )),

                const SizedBox(
                  height: 70,
                ),
                FadeInDown(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    minWidth: double.infinity,
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
