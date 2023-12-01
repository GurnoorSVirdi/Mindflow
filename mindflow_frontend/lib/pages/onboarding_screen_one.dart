import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/routing/app_router.dart';

class OnboardingScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlutterLogo(size: 100),
              SizedBox(height: 24),
              Text(
                'MindFlow',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'The journal that responds to you.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48),
              ElevatedButton.icon(
                icon: Icon(Icons.apple),
                label: Text('Continue with Apple'),
                onPressed: () {
                  context.pushNamed(RouteNames.welcomePage);
                },
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.android),
                label: Text('Continue with Google'),
                onPressed: () {
                  context.pushNamed(RouteNames.welcomePage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
