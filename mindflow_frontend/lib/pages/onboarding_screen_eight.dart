import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/main.dart';
import 'package:mindflow_frontend/routing/app_router.dart';

class OnboardingScreenEight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Spacer(flex: 2),
              Text(
                'Get ready to start your self-reflection journey.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/onboarding_image.png',
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  USER_AUTHENTICATED = true;
                  context.goNamed(RouteNames.talkPage);
                },
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
              Spacer(),
              Text(
                'Try 14 days free on the Individual plan. Then \$7.99/m.Or use MindFlow completely free when you link with a therapist.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
