import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demoflutter/pages/register.dart';
import 'package:demoflutter/widgets/demo_text_form_field.dart';

class DemoLoginPage extends StatefulWidget {
  const DemoLoginPage({super.key, required this.title});

  final String title;

  @override
  State<DemoLoginPage> createState() => _DemoLoginPageState();
}

class _DemoLoginPageState extends State<DemoLoginPage> {
  bool selectedRememberPassword = false;

  void signup() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const RegisterPage(
              title: "Register",
            )));
  }

  void getStarted() {}

  void quicklogin() {
    signup();
  }

  void forgotPassword() {}

  Widget _appName() {
    return Row(
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
    );
  }

  Widget _headerView() {
    return Column(children: [
      const FaIcon(
        FontAwesomeIcons.heartCrack,
        color: Color.fromRGBO(244, 50, 111, 1),
        size: 100,
      ),
      const SizedBox(
        height: 10.0,
      ),
      _appName(),
      const SizedBox(
        height: 2.0,
      ),
      const Text(
        'Find and Meet people around\nyou to find LOVE',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
      ),
      const SizedBox(
        height: 20.0,
      ),
      const Text(
        'SIGN IN',
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ]);
  }

  Widget _contentView() {
    return Padding(
        padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DemeTextFormField(
                  hintText: "Please enter valid email",
                  decoration: DemoDecoration().inputEmailDecoration),
              DemeTextFormField(
                  hintText: "Please enter your password",
                  decoration: DemoDecoration().inputPasswordDecoration),
            ]));
  }

  Widget _actionView() {
    return Column(children: [
      Container(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
          width: MediaQuery.of(context).size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Flexible(
              child: CheckboxListTile(
                title: const Text(
                  'Remember Password',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: selectedRememberPassword,
                checkColor: Colors.white,
                activeColor: Colors.orange,
                onChanged: (bool? value) {
                  setState(() {
                    selectedRememberPassword = value ?? false;
                  });
                },
              ),
            ),
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
            foregroundColor: Colors.transparent),
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
      ),
    ]);
  }

  Widget _footerView() {
    return Expanded(
      child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
              color: const Color.fromARGB(50, 0, 0, 0),
              width: double.infinity,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "DON'T HAVE ACCOUNT?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  MaterialButton(
                      onPressed: () => {signup()},
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
    );
  }

  Widget build(BuildContext context) {
    const backgroundDecoration = BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(255, 255, 146, 102),
        Color.fromARGB(255, 245, 53, 108),
      ],
    ));

    return Scaffold(
      body: Center(
        child: Container(
          decoration: backgroundDecoration,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SafeArea(
                  child: Column(
                children: [_headerView(), _contentView(), _actionView()],
              )),
              _footerView()
            ],
          )),
        ),
      ),
    );
  }
}
