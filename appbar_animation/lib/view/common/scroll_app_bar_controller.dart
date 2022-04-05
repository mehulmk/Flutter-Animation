import 'dart:io';
import 'package:appbar_animation/view/animated/app_bars_controller.dart';
import 'package:appbar_animation/view/scroll_animated/scroll_app_bars_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

extension ScrollAppBarControllerExt on ScrollController {
  static final _controllers = <int, _AppBarController>{};
  static final _scrollControllers = <int, _ScrollAppBarController>{};

  _AppBarController get appBar {
    if (_controllers.containsKey(hashCode)) {
      return _controllers[hashCode]!;
    }
    return _controllers[hashCode] = _AppBarController(this);
  }

  _ScrollAppBarController get scrollAppBar {
    if (_scrollControllers.containsKey(hashCode)) {
      return _scrollControllers[hashCode]!;
    }
    return _scrollControllers[hashCode] = _ScrollAppBarController(this);
  }
}

class _AppBarController extends AppBarsController {
  _AppBarController(ScrollController scrollController)
      : super(scrollController);

  @override
  double height = kToolbarHeight +
      (kIsWeb
          ? 0.0
          : Platform.isAndroid
              ? 24.0
              : 0.0);
}

class _ScrollAppBarController extends ScrollAppBarsController {
  _ScrollAppBarController(ScrollController scrollController)
      : super(scrollController);

  @override
  double height = kToolbarHeight +
      (kIsWeb
          ? 0.0
          : Platform.isAndroid
              ? 24.0
              : 0.0);
}
