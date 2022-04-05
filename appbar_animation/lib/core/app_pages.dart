import 'package:appbar_animation/view/animated/animated_view.dart';
import 'package:appbar_animation/view/home/home_view.dart';
import 'package:appbar_animation/view/scroll_animated/scroll_animated_view.dart';
import 'package:appbar_animation/view/smooth_animated/smooth_animated_view.dart';

class AppPages {
  static const home = "/";
  static const animatedAppBar = "/animatedAppbar";
  static const scrollAnimatedAppBar = "/scrollAnimatedAppbar";
  static const smoothAnimatedAppBar = "/smoothAnimatedAppbar";
}

var appRoutes = {
  AppPages.home: (context) => const HomeView(),
  AppPages.animatedAppBar: (context) => AnimatedView(),
  AppPages.scrollAnimatedAppBar: (context) => ScrollAnimatedView(),
  AppPages.smoothAnimatedAppBar: (context) => const SmoothAnimatedView(),
};
