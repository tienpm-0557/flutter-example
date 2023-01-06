import 'package:demoflutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demoflutter/pages/register.dart';
import 'package:demoflutter/pages/movies/movies.dart';
import 'package:demoflutter/widgets/demo_text_form_field.dart';
import 'package:demoflutter/util/constants.dart';
import 'package:demoflutter/generated/l10n.dart';

import 'package:demoflutter/util/sharedPreferences.dart';

class DemoLoginPage extends StatefulWidget {
  const DemoLoginPage({super.key, required this.title});

  final String title;

  @override
  State<DemoLoginPage> createState() => _DemoLoginPageState();
}

class _DemoLoginPageState extends State<DemoLoginPage> {

  bool _selectedRememberPassword = false;
  final _formKey = GlobalKey<FormState>();

  void _signup() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const RegisterPage(
              title: "Register",
            )));
  }

  void getStarted() {
    if (_formKey.currentState?.validate() ?? false) {
        UserPreferencesManager()
          .didLoginSuccess(
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjExMTExIiwibmFtZSI6IlBoYW0gTWluaCBUaWVuIiwiaWF0IjoxNTE2MjM5MDIyfQ.zKNF8O41ym5Cq3AuHd06AuPDMRXMUg43z9pDvb51LRQ')
          .then((value) => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DemoMoviespage(
                              title: "Popular",
                            )),
                    (r) => false)
              });
    } else {}
  }

  bool validateData() {
    return false;
  }

  void quicklogin() {
    _signup();
  }

  void forgotPassword() {}

  void onSelectRememenber(bool? value) {
    setState(() {
      _selectedRememberPassword = value ?? false;
    });
  }

  late String email = "";
  late String password = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Container(
            decoration: DemoDecoration.backgroundDecoration,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          SafeArea(
                              child: Column(
                            children: [
                              const LoginHeaderView(),
                              ContentView(
                                viewInset: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                                spaceY: 24,
                                isRememberPassword: _selectedRememberPassword,
                                onSelectRememberPassword: onSelectRememenber,
                                loginByFacebook: quicklogin,
                                loginByTwitter: quicklogin,
                                getStarted: getStarted,
                                emailInputOnChange: (value) => setState(() {
                                  email = value;
                                }),
                                passwordInputOnChange: (value) => setState(() {
                                  password = value;
                                }),
                                formKey: _formKey,
                              ),
                            ],
                          )),
                          LoginFooterWidget(
                              viewHeight: 60, viewInset: const EdgeInsets.fromLTRB(0, 0, 0, 0), onSignUp: _signup)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}

class ContentView extends StatelessWidget {
  final EdgeInsets? viewInset;
  final double? spaceY;
  final bool isRememberPassword;
  final ValueChanged<bool?> onSelectRememberPassword;
  final ValueChanged<String>? emailInputOnChange;
  final ValueChanged<String>? passwordInputOnChange;

  final VoidCallback? loginByFacebook;
  final VoidCallback? loginByTwitter;
  final VoidCallback? getStarted;
  final GlobalKey<FormState>? formKey;

  const ContentView(
      {Key? key,
      this.viewInset,
      this.spaceY,
      required this.isRememberPassword,
      required this.onSelectRememberPassword,
      this.loginByFacebook,
      this.loginByTwitter,
      this.getStarted,
      this.emailInputOnChange,
      this.passwordInputOnChange,
      this.formKey})
      : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.orange;
    }
    return const Color(0xffff7944);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: viewInset ?? const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(children: [
            DemeTextFormField(
              hintText: S.of(context).hintEmail,
              decoration: DemoDecoration.inputEmailDecoration,
              viewInset: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              onChange: emailInputOnChange,
              inputType: InputType.email,
            ),
            DemeTextFormField(
                hintText: S.of(context).hintPassword,
                decoration: DemoDecoration.inputPasswordDecoration,
                viewInset: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                onChange: passwordInputOnChange,
                inputType: InputType.password),
            Container(
                padding: EdgeInsets.fromLTRB(0, spaceY ?? 0, 0, 0),
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                    onTap: () {
                      onSelectRememberPassword(!isRememberPassword);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isRememberPassword,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          side: const BorderSide(
                            color: Colors.white, //your desire colour here
                            width: 1.5,
                          ),
                          onChanged: onSelectRememberPassword,
                        ),
                        Text(
                          S.of(context).rememberPassword,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ))),
            Container(
                padding: EdgeInsets.fromLTRB(20, spaceY ?? 0, 20, 0),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 245, 53, 108),
                      shape: const StadiumBorder()),
                  onPressed: getStarted,
                  child: Text(S.of(context).GETSTARTED,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              colors: <Color>[Colors.pink, Colors.orange.shade600],
                            ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 100.0)))),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(20, spaceY ?? 0, 20, 0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: loginByFacebook,
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
                      onPressed: loginByTwitter,
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
                )),
            Container(
                padding: EdgeInsets.fromLTRB(20, spaceY ?? 0, 20, 0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.transparent),
                  onPressed: () {},
                  child: Text(
                    S.of(context).forgotPassword,
                    maxLines: 1,
                    style: const TextStyle(decoration: TextDecoration.underline, color: Colors.white, fontSize: 15.0),
                  ),
                )),
          ]),
        ));
  }
}

class LoginHeaderView extends StatelessWidget {
  final EdgeInsets? viewInset;

  const LoginHeaderView({Key? key, this.viewInset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: viewInset ?? const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(children: [
        Image.asset(Assets.images.connexion.path, width: 100, height: 100),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('CONN',
                style: TextStyle(fontSize: 30.0, color: Color.fromRGBO(244, 48, 115, 1), fontWeight: FontWeight.w600)),
            Text('EXION', style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 2.0),
        Text(
          S.of(context).shortIntroduction,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
        ),
        const SizedBox(height: 20.0),
        Text(
          S.of(context).SIGNIN,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ]),
    );
  }
}

class LoginFooterWidget extends StatelessWidget {
  final EdgeInsets? viewInset;
  final double? viewHeight;
  final VoidCallback? onSignUp;

  const LoginFooterWidget({Key? key, this.viewInset, this.viewHeight, required this.onSignUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: viewInset ?? const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: viewHeight,
        width: MediaQuery.of(context).size.width,
        color: Colors.black26,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).dontHaveAccount,
              style: const TextStyle(color: Colors.orange, fontSize: 16.0),
            ),
            TextButton(
                onPressed: () => {
                      if (onSignUp != null) {onSignUp!()}
                    },
                child: Text(
                  S.of(context).SIGNUP,
                  style: const TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontSize: 16),
                ))
          ],
        ));
  }
}
