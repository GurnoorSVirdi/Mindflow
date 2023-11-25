import 'package:flutter/material.dart';
import 'package:mindflow_frontend/styles.dart';
import 'package:mindflow_frontend/widgets/session_button.dart';

class TalkPage extends StatefulWidget {
  const TalkPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<TalkPage> createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Hello, Annie", style: heading1),
                Text("How would you like to reflect?", style: heading2),
                const SessionButton(
                  title: "Guided by Your Provider",
                  desc:
                      "Reflect on what you should go over before your next appointment",
                  color: Color.fromRGBO(100, 57, 133, 1),
                  ctaText: "GO",
                  imgPath: "assets/doctor.png",
                ),
                const SessionButton(
                  title: "Freeform",
                  desc: "Reflect on anything that comes to mind. No pressure.",
                  color: Color.fromRGBO(168, 118, 113, 1),
                  ctaText: "GO",
                  imgPath: "assets/bonsai.png",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
