import 'package:flutter/material.dart';

class SmoothAnimatedView extends StatefulWidget {
  const SmoothAnimatedView({Key? key}) : super(key: key);

  @override
  State<SmoothAnimatedView> createState() => _SmoothAnimatedViewState();
}

class _SmoothAnimatedViewState extends State<SmoothAnimatedView>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> elevationTween;
  late Animation<double> radiusTween;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    elevationTween = Tween(begin: 0.0, end: 4.0).animate(animationController);
    radiusTween = Tween(begin: 0.0, end: 18.0).animate(animationController);
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical &&
        scrollInfo.metrics.pixels <= 127) {
      animationController.animateTo(scrollInfo.metrics.pixels / 127);
      return true;
    } else {
      animationController.animateTo(1.0);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(
          color: Colors.black,
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Stack(
          children: [
            ListView.builder(
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
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: kToolbarHeight,
              width: MediaQuery.of(context).size.width,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => PhysicalModel(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: elevationTween.value,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radiusTween.value),
                      bottomRight: Radius.circular(radiusTween.value)),
                  child: child,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        customBorder: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Scrollable App bar",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
