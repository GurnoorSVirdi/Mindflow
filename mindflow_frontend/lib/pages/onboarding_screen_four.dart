import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/main.dart';
import 'package:mindflow_frontend/routing/app_router.dart';

class OnboardingScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Spacer(flex: 2),
            Image.asset(
              'assets/onboarding_image.png',
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(4, (index) {
                // 4 dots now
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? Colors.deepPurple
                        : Colors.grey[300], // First dot in purple
                  ),
                );
              }),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              'How it works',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Text(
                'Journal your thoughts simply by talking to MindFlow. Stuck on what to say? '
                'MindFlow helps you understand what you’re going through. '
                'Every conversation you have with MindFlow gets saved into a log.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Every conversation you have with MindFlow gets '
                'saved into a log.',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 100, 96, 173),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  USER_AUTHENTICATED = true;
                  context.goNamed(RouteNames.talkPage);
                },
                child: Text('Next',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  primary: Color(0xFF5B588B),
                  minimumSize: Size(double.infinity,
                      50), // double.infinity is the width and 50 is the height
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
