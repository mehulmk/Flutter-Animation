import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:appbar_animation/view/common/scroll_app_bar_controller.dart';

class ScrollAppBarView extends StatefulWidget with PreferredSizeWidget {
  ScrollAppBarView({
    Key? key,
    required this.controller,
    required this.child,
    this.elevation = 4.0,
    this.backgroundColor,
    this.backgroundGradient,
    this.materialType = MaterialType.canvas,
    this.height = kToolbarHeight,
  }) : super(key: key);

  final ScrollController controller;
  final Widget child;
  final double elevation;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final MaterialType materialType;
  final double height;

  @override
  _ScrollAppBarViewState createState() => _ScrollAppBarViewState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _ScrollAppBarViewState extends State<ScrollAppBarView> {
  late Widget appBar;

  @override
  Widget build(BuildContext context) {
    appBar = PreferredSize(
      preferredSize: Size.fromHeight(widget.height),
      child: widget.child,
    );

    return ValueListenableBuilder<bool>(
      valueListenable: widget.controller.scrollAppBar.pinNotifier,
      builder: _pin,
    );
  }

  Widget _pin(BuildContext context, bool isPinned, Widget? child) {
    if (isPinned) return _align(1.0);

    return ValueListenableBuilder<double>(
      valueListenable: widget.controller.scrollAppBar.heightNotifier,
      builder: _height,
    );
  }

  Widget _height(BuildContext context, double height, Widget? child) {
    return _align(height);
  }

  Widget _align(double heightFactor) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Align(
          alignment: const Alignment(0, 1),
          heightFactor: heightFactor,
          child: _elevation(heightFactor),
        ),
      ),
    );
  }

  Widget _elevation(double heightFactor) {
    return Material(
      elevation: widget.elevation,
      type: widget.materialType,
      child: _decoratedContainer(heightFactor),
    );
  }

  Widget _decoratedContainer(double heightFactor) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.backgroundGradient,
      ),
      child: _opacity(heightFactor),
    );
  }

  Widget _opacity(double heightFactor) {
    return Opacity(
      opacity: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ).transform(heightFactor),
      child: appBar,
    );
  }
}
