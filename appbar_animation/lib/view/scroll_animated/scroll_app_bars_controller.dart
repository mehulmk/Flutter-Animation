import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

abstract class ScrollAppBarsController {
  ScrollAppBarsController(this.scrollController) {
    scrollController.addListener(_scrollListener);
  }

  /// Height of the bar
  double get height;

  /// Scroll controller
  ScrollController scrollController;

  /// Notifier of the visible height factor of bar
  final heightNotifier = ValueNotifier<double>(0.0);

  /// Notifier of the pin state changes
  final pinNotifier = ValueNotifier<bool>(false);

  /// Returns [true] if the bar is pinned or [false] if the bar is not pinned
  bool get isPinned => pinNotifier.value;

  /// Set a new pin state
  void setPinState(bool state) => pinNotifier.value = state;

  /// Toogle the pin state
  void tooglePinState() => setPinState(!pinNotifier.value);

  double _delta = 0.0, _oldOffset = 0.0;

  double get _heightFactor => (_delta / height);

  void _scrollListener() {
    ScrollPosition position = scrollController.position;
    double pixels = 0;
    if (position.pixels < 250) {
      pixels = 0;
    } else if (position.pixels > 250 + height) {
      pixels = height;
    } else {
      pixels = position.pixels - 250;
    }
    _delta = (_delta + pixels - _oldOffset).clamp(0.0, height);
    _oldOffset = pixels;

    if (position.axisDirection == AxisDirection.down &&
        position.extentAfter == 1.0) {
      if (heightNotifier.value == 1.0) return;
      heightNotifier.value = 1.0;
      return;
    }

    if (position.axisDirection == AxisDirection.up &&
        position.extentBefore == 0.0) {
      if (heightNotifier.value == 0.0) return;
      heightNotifier.value = 0.0;
      return;
    }

    if ((_delta == 0.0 && heightNotifier.value == 0.0) ||
        (_delta == height && heightNotifier.value == 1.0)) return;
    heightNotifier.value = _heightFactor;
  }

  /// Discards resources
  void dispose() {
    pinNotifier.dispose();
    heightNotifier.dispose();
  }
}
