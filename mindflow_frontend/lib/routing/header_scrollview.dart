import 'package:flutter/material.dart';
import 'package:mindflow_frontend/routing/app_router.dart';
import 'package:mindflow_frontend/widgets/main_header.dart';

class HeaderScrollView extends StatelessWidget {
  const HeaderScrollView({
    super.key,
    required this.child,
    required this.controller,
  });

  final Widget child;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: controller, slivers: [
      SliverAppBar(
        //shadowColor: Colors.white.withOpacity(0),
        floating: true,
        stretch: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.black.withOpacity(0.2),
        expandedHeight: 0,
        flexibleSpace: FlexibleSpaceBar(
            background: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  scrollToTop(controller);
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: MainHeader(),
                ))),
      ),
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0), child: child))
    ]);
  }
}
