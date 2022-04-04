import 'dart:io';
import 'package:appbar_animation/view/common/scroll_bars_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

extension ScrollAppBarControllerExt on ScrollController {
  static final _controllers = <int, _ScrollAppBarController>{};

  _ScrollAppBarController get appBar {
    if (_controllers.containsKey(hashCode)) {
      return _controllers[hashCode]!;
    }
    return _controllers[hashCode] = _ScrollAppBarController(this);
  }
}

class _ScrollAppBarController extends ScrollBarsController {
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
