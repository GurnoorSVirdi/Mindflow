import 'package:flutter/material.dart';

class OnboardingScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Spacer(flex: 2), // Adjusts the space at the top
            Image.asset(
              'assets/onboarding_image.png', // Placeholder for the actual image asset
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
            SizedBox(height: 16), // Reduced space above the subtext
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Text(
                'Journal your thoughts simply by talking to MindFlow. Stuck on what to say? '
                'MindFlow helps you understand what you’re going through.\n\n'
                'Every conversation you have with MindFlow gets saved into a log.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(flex: 3), // Adjusts the space below the subtext
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(double.infinity,
                    36.0), // match_parent width and wrap_content height
              ),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(), // Adjusts the space at the bottom
          ],
        ),
      ),
    );
  }
}
