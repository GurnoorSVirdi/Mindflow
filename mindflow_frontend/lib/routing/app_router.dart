import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/pages/history.dart';
import 'package:mindflow_frontend/pages/onboarding_screen_one.dart';
import 'package:mindflow_frontend/pages/onboarding_screen_two.dart';
import 'package:mindflow_frontend/pages/onboarding_screen_three.dart';
import 'package:mindflow_frontend/pages/onboarding_screen_four.dart';

import 'package:mindflow_frontend/pages/talk.dart';
import 'package:mindflow_frontend/routing/nav_bar.dart';

//global controller for tab index, (0 = HomePage, 1 = TakeFeed, 2 = ProfilePage)
//set to the initial index when the app is opened
ValueNotifier<int> tabController = ValueNotifier<int>(0);

//key to contol navigation bar buttons
final GlobalKey<NavigationButtonsState> navigationButtonsKey = GlobalKey();

//can be used to reference the scroll controllers
//for homepage
final ScrollController scroll_controller0 = ScrollController();
//for profile page
final ScrollController scroll_controller1 = ScrollController();

//method to scroll to top of the pagfe
void scrollToTop(ScrollController controller) {
  if (controller.hasClients) {
    controller.animateTo(controller.position.minScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

//global used within the shell routes to reference the navigators
final GlobalKey<NavigatorState> navigator_key0 = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigator_key1 = GlobalKey<NavigatorState>();

//router references routes by route names
class RouteNames {
  static const talkPage = 'talkPage';
  static const historyPage = 'historyPage';
}

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  redirect: (context, state) {
    //FlutterNativeSplash.remove();
  },
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        // Return the widget that implements the custom shell (in this case
        // using a BottomNavigationBar). The StatefulNavigationShell is passed
        // to be able access the state of the shell and to navigate to other
        // branches in a stateful way.
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        // The route branch for the first tab of the bottom navigation bar.
        StatefulShellBranch(
          navigatorKey: navigator_key0,
          routes: <RouteBase>[
            GoRoute(
              // The screen to display as the root in the first tab of the
              // bottom navigation bar.
              name: RouteNames.talkPage,
              path: '/',
              builder: (BuildContext context, GoRouterState state) =>
                  const TalkPage(),
              routes: [],
            ),
          ],
        ),

        // The route branch for the second tab of the bottom navigation bar.
        StatefulShellBranch(
          navigatorKey: navigator_key1,
          // It's not necessary to provide a navigatorKey if it isn't also
          // needed elsewhere. If not provided, a default key will be used.
          routes: <RouteBase>[
            //default take feed
            GoRoute(
              // The screen to display as the root in the second tab of the
              // bottom navigation bar.
              name: RouteNames.historyPage,
              path: '/history',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(
                  child: OnboardingScreenFour(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    int index = navigationShell.currentIndex;
    //navigate to the first index on the navigation bar

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: CriticaNavBar(
        navigateBottomBar: _setTabIndex,
        initial_index: index,
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _setTabIndex(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // support navigating to the initial location when tapping the item that is
      // already active.
      initialLocation: index == navigationShell.currentIndex,
    );

    if (index == navigationShell.currentIndex) {
      //if current navigator can't pop, it should scroll to the top for selected nav.
      if (navigationShell.shellRouteContext.navigatorKey.currentState
              ?.canPop() ==
          false) {
        if (navigationShell.currentIndex == 0) {
          scrollToTop(scroll_controller0);
        }
        if (navigationShell.currentIndex == 1) {
          scrollToTop(scroll_controller1);
        }
      }
    }
  }
}
