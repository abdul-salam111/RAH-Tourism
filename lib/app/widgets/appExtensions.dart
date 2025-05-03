import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get widths => size.width;
  double get heights => size.height;

  Future push(Widget widget) async {
    return Navigator.push(
        this, MaterialPageRoute(builder: (builder) => widget));
  }

  void pop(Widget widget) async {
    return Navigator.pop(this);
  }

  Widget heightbox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget widthbox(double width) {
    return SizedBox(
      width: width,
    );
  }
}
