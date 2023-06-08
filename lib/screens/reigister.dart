import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saviour/screens/login.dart';
import 'package:saviour/screens/otp.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countrycode = TextEditingController();

  @override
  void initState() {
    countrycode.text = "+977 ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/front.png",
                  width: size.width * 0.7,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 50,
                ),
                FadeInDown(
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeInDown(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Enter your phone number",
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900),
                    ),
                  ),
                ),
                FadeInDown(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "We will send you a verification code",
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FadeInDown(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(31, 29, 28, 28),
                          blurRadius: 20,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.15),
                      ),
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          textFieldController: phoneNumberController,
                          onInputChanged: (value) {
                            print(value.phoneNumber);
                          },
                          formatInput: false,
                          selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG),
                          cursorColor: Colors.black,
                          inputDecoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 15, left: 20),
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              letterSpacing: 0.6,
                              color: Colors.grey.shade500,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                FadeInDown(
                  child: MaterialButton(
                    onPressed: () async {
                      print("req clicked");
                      print(countrycode);

                      Navigator.of(context).pushNamed("/");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PinCodeVerificationScreen(
                                    phoneNumberController.text,
                                  )));
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 25),
                    minWidth: double.infinity,
                    child: const Text(
                      "Request OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ? ",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4),
                    ),
                    TextButton(
                        onPressed: () {
                          // print("clicked");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2),
                        ))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
