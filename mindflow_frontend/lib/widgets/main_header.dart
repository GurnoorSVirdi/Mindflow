import 'package:flutter/material.dart';
import 'package:mindflow_frontend/styles.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            minWidth: 0,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/future.jpeg")),
                    shape: BoxShape.circle)),
          ),
          MaterialButton(
            minWidth: 0,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.menu,
                  size: 30,
                ),
                color: Color.fromARGB(69, 159, 159, 159),
              ),
            ),
          )
        ],
      ),
    );
  }
}
