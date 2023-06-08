import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:saviour/drawer/screens/beforedrawer.dart';
import 'package:saviour/navbar/bottomnavbar.dart';
import 'package:saviour/screens/home.dart';
import 'package:saviour/screens/reigister.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  "assets/image/login.png",
                  width: size.width * 0.7,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 50,
                ),
                FadeInDown(
                  child: const Text(
                    "Login",
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onSaved: (email) {},
                          decoration: const InputDecoration(
                            hintText: "Your Phone Number",
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Your password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        // return const BottomNavBar();  // customappbar ko zoomdrawer ma error  .
                        return const BeforeHomeDrawer();
                      }));
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    minWidth: double.infinity,
                    child: const Text(
                      "Login",
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
                      "Not registered yet ? ",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const RegisterPage();
                          }));
                        },
                        child: const Text(
                          "Register",
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
