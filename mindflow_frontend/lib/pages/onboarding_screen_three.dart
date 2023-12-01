import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/routing/app_router.dart';

class OnboardingScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hi Sam! Were you referred by a therapist?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              Text(
                'If so, enter their 6-digit code below',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => _buildCodeBox()),
              ),
              TextButton(
                onPressed: () {},
                child: Text('need help?'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(RouteNames.tutorialPage);
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.pushNamed(RouteNames.tutorialPage);
                },
                child: Text("No, I wasn't referred by a therapist/provider"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeBox() {
    return Container(
      width: 40,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: InputBorder.none),
        // You may want to use a TextEditingController to handle the input
      ),
    );
  }
}
