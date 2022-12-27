import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demoflutter/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.white
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selectedRememberPassword = false;

  void signup() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage(title: "Register",)));
  }

  void getStarted() {}

  void quicklogin() {}

  void forgotPassword() {}

  Widget build(BuildContext context) {
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
          child:
           Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SafeArea(child:Column(children: [const FaIcon(
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
                height: 20.0,
              ),
              const Text(
                'SIGN IN',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter Email",
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Password",
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                      ])),
              Container(
                  padding: const EdgeInsets.only(
                      top: 0, left: 20, right: 20, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          title: const Text(
                            'Remember Password',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: selectedRememberPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              selectedRememberPassword = value ?? false;
                            });
                          },
                        )
                      ])),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 245, 53, 108),
                    shape: const StadiumBorder()),
                onPressed: () {},
                child: const Text(
                  'GET STARTED',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      quicklogin();
                    },
                    color: Colors.white,
                    textColor: const Color.fromARGB(255, 245, 53, 108),
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                    child: const FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Color.fromRGBO(244, 50, 111, 1),
                      size: 30,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      quicklogin();
                    },
                    color: Colors.white,
                    textColor: const Color.fromARGB(255, 245, 53, 108),
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                    child: const FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Color.fromRGBO(244, 50, 111, 1),
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor:  Colors.transparent),
                onPressed: () {},
                child: const Text(
                'FORGOT PASSWORD?',
                maxLines: 1,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              ),],)),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                        color: const Color.fromARGB(50, 0, 0, 0),
                        width: double.infinity,
                        height: 80,
                        child:
                        
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                                  "DON'T HAVE ACCOUNT?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                            MaterialButton(
                                onPressed: () => {
                                  signup()
                                  },
                                child: const Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                )),
                          ],
                        ))),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
