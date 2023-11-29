import 'package:flutter/material.dart';
import 'package:mindflow_frontend/styles.dart';
import 'package:mindflow_frontend/widgets/session_button.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.account_circle),
          title: Text('MindFlow'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 10, // Placeholder for the number of entries
          itemBuilder: (context, index) {
            return EntryCard();
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(icon: Icon(Icons.history), onPressed: () {}),
              IconButton(icon: Icon(Icons.chat), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class EntryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'October 2, 2023',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'I was walking down the street and I remembered that we had left...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.purple,
                ),
                SizedBox(width: 10),
                Text(
                  'suggested by provider',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
