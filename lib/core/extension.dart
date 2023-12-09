import 'package:flutter/material.dart';

extension TextLanguges on Widget {
  Widget arabicText() => Align(
      alignment: Alignment.centerRight,
      child: Directionality(textDirection: TextDirection.rtl, child: this));

  Widget rightDirction() =>
      Directionality(textDirection: TextDirection.rtl, child: this);
}

extension WidgetPadding on Widget {
  Widget pSymmetric({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? 0, vertical: vertical ?? 0),
      child: this,
    );
  }

  Widget pOnly({double? top, double? bottom, double? left, double? right}) {
    return Padding(
        padding: EdgeInsets.only(
            top: top ?? 0,
            bottom: bottom ?? 0,
            left: left ?? 0,
            right: right ?? 0),
        child: this);
  }
}
