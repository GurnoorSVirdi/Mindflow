import 'package:flutter/material.dart';
import 'package:mindflow_frontend/theme.dart';

class SessionButton extends StatelessWidget {
  const SessionButton(
      {super.key,
      required this.title,
      required this.desc,
      required this.color,
      required this.imgPath,
      required this.ctaText,
      required this.onPressed});

  final String title;
  final String desc;
  final String ctaText;
  final Color color;
  final String imgPath;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onPressed();
        },
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
          child: Stack(
            children: [
              Container(
                color: color,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 72, 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.values[5],
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                          fontWeight: FontWeight.values[3],
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          ctaText,
                          style: TextStyle(
                              fontWeight: FontWeight.values[5],
                              fontSize: 14,
                              color: darken(color, 0.5)),
                        ),
                        Icon(Icons.arrow_forward, color: darken(color, 0.5))
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  imgPath,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
