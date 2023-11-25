import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/routing/app_router.dart';
import 'package:mindflow_frontend/theme.dart';

const double NAV_ICON_SIZE = 35;

//might have to create a new widget that contains both the bottom navigation bar and the music player
//so they're separate.
class CriticaNavBar extends StatelessWidget {
  const CriticaNavBar(
      {Key? key, required this.navigateBottomBar, required this.initial_index})
      : super(key: key);
  final void Function(BuildContext, int) navigateBottomBar;

  final int initial_index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hasBottomNotch(context) ? 100 : 120,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          //navigation buttons
          Align(
              alignment: Alignment.bottomCenter,
              child: NavigationButtons(
                  navigateBottomBar: navigateBottomBar,
                  key: navigationButtonsKey,
                  initial_index: initial_index)),
        ],
      ),
    );
  }
}

class NavigationButtons extends StatefulWidget {
  const NavigationButtons(
      {required this.navigateBottomBar, Key? key, required this.initial_index})
      : super(key: key);
  final void Function(BuildContext, int) navigateBottomBar;
  final int initial_index;
  @override
  State<NavigationButtons> createState() => NavigationButtonsState();
}

class NavigationButtonsState extends State<NavigationButtons> {
  //set to the initial index when the app is opened
  late int selectedIndex;

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
      widget.navigateBottomBar(context, index);
    });
  }

  Widget build(BuildContext context) {
    selectedIndex = widget.initial_index;

    return Builder(builder: (context) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: Offset(0, -9), // changes position of shadow
              ),
            ],
          ),
          child:
              //material 3 design version
              ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomAppBar(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: (selectedIndex == 0)
                            ? const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.mic, size: NAV_ICON_SIZE),
                                  Text(
                                    "Speak",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            : const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.mic,
                                    size: NAV_ICON_SIZE,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Speak",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  )
                                ],
                              ),
                        onPressed: () async {
                          changeIndex(0);
                          HapticFeedback.mediumImpact();
                        },
                      ),
                      MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: (selectedIndex == 1)
                            ? const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.tag_faces, size: NAV_ICON_SIZE),
                                  Text(
                                    "History",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            : const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.tag_faces,
                                    size: NAV_ICON_SIZE,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "History",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  )
                                ],
                              ),
                        onPressed: () {
                          changeIndex(1);
                          HapticFeedback.mediumImpact();
                        },
                      ),
                    ]),
              ),
            ),
          ));
    });
  }
}

bool hasBottomNotch(BuildContext context) {
  var mediaQuery = MediaQuery.of(context);
  if (mediaQuery.padding.bottom > 0) {
    return false;
  } else {
    return true;
  }
}
