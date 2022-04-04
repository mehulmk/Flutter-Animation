import 'package:appbar_animation/view/animated/scroll_app_bar.dart';
import 'package:flutter/material.dart';

class AnimatedView extends StatelessWidget {
  AnimatedView({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        child: AppBar(
          title: const Text("Scrollable App bar"),
        ),
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: 50,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Item ${index + 1}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
