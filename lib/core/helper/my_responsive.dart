import 'package:flutter/material.dart';

abstract class MyResponsive {
  static double height(context, {required double value}) =>
      MediaQuery.of(context).size.height * (value / 1000);

  static double width(context, {required double value}) =>
      MediaQuery.of(context).size.width * (value / 375);

  static double fontSize(context, {required double value}) =>
      MediaQuery.of(context).size.width * (value / 375);

  static EdgeInsets paddingSymmetric(
    context, {
    double? horizontal,
    double? vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: width(context, value: horizontal ?? 0),
      vertical: height(context, value: vertical ?? 0),
    );
  }

  static EdgeInsets paddingOnly(
    context, {
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: width(context, value: left ?? 0),
      right: width(context, value: right ?? 0),
      top: height(context, value: top ?? 0),
      bottom: height(context, value: bottom ?? 0),
    );
  }
}
