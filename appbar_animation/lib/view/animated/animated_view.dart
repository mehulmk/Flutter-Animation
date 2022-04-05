import 'package:appbar_animation/view/animated/app_bar_view.dart';
import 'package:flutter/material.dart';

class AnimatedView extends StatelessWidget {
  AnimatedView({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: controller,
            itemCount: 50,
            padding: const EdgeInsets.only(top: kToolbarHeight),
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
          AppBarView(
            controller: controller,
            height: kToolbarHeight,
            child: AppBar(
              title: const Text("Scrollable App bar"),
            ),
          ),
        ],
      ),
    );
  }
}
