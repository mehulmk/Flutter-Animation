import 'package:appbar_animation/core/app_pages.dart';
import 'package:appbar_animation/data/model/animation_type.dart';

class AppConstant {
  static List<AnimationType> appBarUseCaseList = [
    AnimationType(
      title: "Animated Appbar",
      desc: "Animate appbar with ValueNotifier and addListener",
      pageRoute: AppPages.animatedAppBar,
    ),
    AnimationType(
      title: "Animated Appbar after scroll",
      desc: "Animate appbar with ValueNotifier and addListener",
      pageRoute: AppPages.scrollAnimatedAppBar,
    ),
    AnimationType(
      title: "Smooth Animated Appbar",
      desc: "Appbar with NotificationListener and AnimationBuilder",
      pageRoute: AppPages.smoothAnimatedAppBar,
    ),
    AnimationType(
      title: "Custom Appbar Animation",
      desc: "Appbar with NotificationListener and AnimationBuilder",
      pageRoute: AppPages.customAnimatedAppBar,
    ),
  ];
}
