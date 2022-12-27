import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});
  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool selectedRememberPassword = false;

  void backToSignIn() {
    Navigator.pop(context);
  }

  void signInWithFacebook() {}

  void signInWithTwister() {}

  void signUp() {}

  Widget build(BuildContext context) {
    double contentWidth = MediaQuery.of(context).size.width - 50;

    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 255, 146, 102),
              Color.fromARGB(255, 245, 53, 108),
            ],
          )),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SafeArea(
                  child: Column(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.heartCrack,
                    color: Color.fromRGBO(244, 50, 111, 1),
                    size: 100,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('CONN',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Color.fromRGBO(244, 48, 115, 1),
                              fontWeight: FontWeight.w600)),
                      Text('EXION',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  const Text(
                    'Find and Meet people around\nyou to find LOVE',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(contentWidth, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 245, 53, 108),
                        shape: const StadiumBorder()),
                    onPressed: () {
                      signInWithFacebook();
                    },
                    child: const Text(
                      'Sign in with Facebook',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 245, 53, 108)),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(contentWidth, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 245, 53, 108),
                        shape: const StadiumBorder()),
                    onPressed: () {
                      signInWithTwister();
                    },
                    child: const Text(
                      'Sign in with Twister',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 245, 53, 108)),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(contentWidth, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 245, 53, 108),
                        shape: const StadiumBorder()),
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 245, 53, 108)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.transparent),
                    onPressed: () {
                      backToSignIn();
                    },
                    child: const Text(
                      "ALREADY REGISTERED? SIGN IN",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              )),
            ],
          )),
        ),
      ),
    );
  }
}
