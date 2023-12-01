import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/main.dart';
import 'package:mindflow_frontend/routing/app_router.dart';

class OnboardingScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                  'assets/onboarding_image.png'), // Replace with your actual image path
              SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLine(context, false),
                  _buildDot(context, true),
                  _buildDot(context, false),
                  _buildDot(context, false),
                  _buildDot(context, false),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'How it works',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Journal your thoughts simply by talking to '
                'MindFlow. Stuck on what to say? MindFlow helps '
                'you understand what you’re going through.',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 100, 96, 173),
                    fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(BuildContext context, bool isActive) {
    return Container(
      height: 8,
      width: isActive ? 24 : 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildLine(BuildContext context, bool isActive) {
    return Container(
      height: 8,
      width: isActive ? 80 : 80,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Color(0xFF5B588B),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
