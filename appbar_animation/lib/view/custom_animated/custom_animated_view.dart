import 'package:flutter/material.dart';

class CustomAnimatedView extends StatefulWidget {
  const CustomAnimatedView({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedView> createState() => _CustomAnimatedViewState();
}

class _CustomAnimatedViewState extends State<CustomAnimatedView>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation bgColorTween;
  late Animation<double> elevationTween;
  late Animation<double> subtitleVisibilityTween;
  late Animation<double> radiusTween;
  late Animation<double> heightTween;
  late Animation<TextStyle> textStyleTween;
  late Animation<double> outlineImageBottomPositionTween;
  late Animation<double> fillImageBottomPositionTween;
  late Animation<double> outlineImageRightPositionTween;
  late Animation<double> fillImageRightPositionTween;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    bgColorTween =
        ColorTween(begin: Colors.black, end: const Color(0xFF212121)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    elevationTween = Tween(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    subtitleVisibilityTween = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );
    radiusTween = Tween(begin: 0.0, end: 18.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    heightTween = Tween(begin: 183.0, end: 56.0).animate(animationController);
    textStyleTween = TextStyleTween(
        begin: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        end: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        )).animate(animationController);

    outlineImageBottomPositionTween =
        Tween(begin: 90.0, end: 56.0).animate(animationController);
    outlineImageRightPositionTween =
        Tween(begin: -70.0, end: -150.0).animate(animationController);
    fillImageBottomPositionTween =
        Tween(begin: 54.0, end: 136.0).animate(animationController);
    fillImageRightPositionTween =
        Tween(begin: -54.0, end: -240.0).animate(animationController);
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
              padding: const EdgeInsets.only(top: 200),
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return PhysicalModel(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    elevation: elevationTween.value,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radiusTween.value),
                      bottomRight: Radius.circular(radiusTween.value),
                    ),
                    child: SizedBox(
                      height: heightTween.value,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: fillImageBottomPositionTween.value,
                            right: fillImageRightPositionTween.value,
                            child: Icon(
                              Icons.crop_square_outlined,
                              size: 200,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                          Positioned(
                            bottom: outlineImageBottomPositionTween.value,
                            right: outlineImageRightPositionTween.value,
                            child: Icon(
                              Icons.image,
                              size: 175,
                              color: Colors.grey.withOpacity(0.08),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 7),
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
                          Positioned(
                            bottom: 0.0,
                            left: 36 * animationController.value,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 14, left: 20, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Scrollable App bar",
                                    style: textStyleTween.value,
                                  ),
                                  SizeTransition(
                                    sizeFactor: subtitleVisibilityTween,
                                    child: Opacity(
                                      opacity: subtitleVisibilityTween.value,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width -
                                              62,
                                          child: Text(
                                            "Some dummy text, Some dummy text, Some dummy text ",
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
