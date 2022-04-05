import 'package:appbar_animation/view/animated/app_bar_view.dart';
import 'package:appbar_animation/view/scroll_animated/scroll_app_bar_view.dart';
import 'package:flutter/material.dart';

class ScrollAnimatedView extends StatelessWidget {
  ScrollAnimatedView({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  color: Colors.black12,
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.only(left: 16, top: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    "Some Text",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                      text: "Scrollable App",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 32),
                      children: const <TextSpan>[
                        TextSpan(
                            text: " bar",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) => Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Item ${index + 1}",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          ScrollAppBarView(
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
