import 'package:demoflutter/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, unselectedWidgetColor: Colors.white),
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
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 245, 53, 108),
                        shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DemoLoginPage(
                                title: "Login",
                              )));
                    },
                    child: const Text(
                      'GET STARTED',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 245, 53, 108)),
                    ),
                  )
                ],
              )),
            ],
          )),
        ),
      ),
    );
  }
}
