import 'package:flutter/material.dart';

class OnboardingScreenFive extends StatelessWidget {
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
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 1 ? Colors.deepPurple : Colors.grey[300],
                  ),
                );
              }),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              'Keep your therapist updated',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Text(
                'Life happens outside of therapy sessions, and sometimes you can’t keep your therapist updated.\n\n Allow your therapist to track your progress, even when you’re not meeting with them 1-1.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(flex: 3),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(double.infinity, 36.0),
              ),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
