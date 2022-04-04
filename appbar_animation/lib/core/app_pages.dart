import 'package:appbar_animation/view/animated/animated_view.dart';
import 'package:appbar_animation/view/home/home_view.dart';

class AppPages {
  static const home = "/";
  static const animatedAppBar = "/animatedAppbar";
}

var appRoutes = {
  AppPages.home: (context) => const HomeView(),
  AppPages.animatedAppBar: (context) =>  AnimatedView(),
};
