import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/routing/app_router.dart';
import 'package:mindflow_frontend/styles.dart';
import 'package:mindflow_frontend/widgets/session_button.dart';

class TalkPage extends StatefulWidget {
  const TalkPage({super.key});

  @override
  State<TalkPage> createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  void _incrementCounter() {
    setState(() {});
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
                SessionButton(
                  title: "Guided by Your Provider",
                  desc:
                      "Reflect on what you should go over before your next appointment",
                  color: Color.fromRGBO(100, 57, 133, 1),
                  ctaText: "GO",
                  imgPath: "assets/doctor.png",
                  onPressed: () {},
                ),
                SessionButton(
                  title: "Freeform",
                  desc: "Reflect on anything that comes to mind. No pressure.",
                  color: Color.fromRGBO(168, 118, 113, 1),
                  ctaText: "GO",
                  imgPath: "assets/bonsai.png",
                  onPressed: () {
                    context.pushNamed(
                      RouteNames.sessionPage,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
