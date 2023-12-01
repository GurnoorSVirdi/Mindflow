import 'package:flutter/material.dart';
import 'package:mindflow_frontend/routing/app_router.dart';
import 'package:mindflow_frontend/routing/header_scrollview.dart';
import 'package:mindflow_frontend/styles.dart';
import 'package:mindflow_frontend/widgets/main_header.dart';

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
        body: HeaderScrollView(
          controller: scroll_controller1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text("History", style: heading2),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text("TODAY", style: subheading1),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10, // Placeholder for the number of entries
                itemBuilder: (context, index) {
                  return EntryCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
/* Text("History", style: heading2),
              Text("TODAY", style: subheading1),*/

class EntryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: Color.fromARGB(255, 219, 219, 219), width: 1)),
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
    );
  }
}
