import 'dart:math';
import 'package:flutter/material.dart';


extension MediaQueryExt on BuildContext {
  Size get mqSize => MediaQuery.sizeOf(this);

  double get height => mqSize.height;

  double get width => mqSize.width;
}

extension PaddingExt on Widget {
  Padding viewInsets(BuildContext context) => Padding(padding: MediaQuery.viewInsetsOf(context));

  Padding pAll(double value, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding pOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );

  Padding px(double horizontal, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: horizontal),
        child: this,
      );

  Padding py(double vertical, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: 0),
        child: this,
      );
}

extension IterableExt<T> on Iterable<T> {
  double sumByDouble(num Function(T) selector) {
    ArgumentError.checkNotNull(selector, 'selector');
    return map(selector).fold(0.0, (prev, curr) => prev + curr);
  }
}

extension SizeBoxEx on num {
  Widget get widthBox => SizedBox(width: toDouble());

  Widget get heightBox => SizedBox(height: toDouble());
}

extension SizedBoxExtension on Widget {
  Widget w(double width, {Key? key}) => SizedBox(
        key: key,
        width: width,
        child: this,
      );

  Widget wFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.width,
        child: this,
      );

  Widget h(double height) => SizedBox(
        key: key,
        height: height,
        child: this,
      );

  Widget hFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.height,
        child: this,
      );

  Widget wh(double? width, double? height) => SizedBox(
        key: key,
        width: width,
        height: height,
        child: this,
      );

  Widget whFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.width,
        height: context.height,
        child: this,
      );
}

extension RandomOfDigits on Random {
  num nextIntOfDigits(num digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    num min = digitCount == 1 ? 0 : pow(10, digitCount - 1);
    num max = pow(10, digitCount);
    return min + nextInt((max - min).toInt());
  }
}

extension IterableExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension CenterExtension on Widget {
  Widget wrapCenter() => Center(child: this);
}

extension ExpandedExtension on Widget {
  Widget expanded({int? flex}) => Expanded(flex: flex ?? 1, child: this);
}

extension PositionedExtension on Widget {
  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Positioned(top: top, bottom: bottom, right: right, left: left, child: this);
}

extension PinputControllerExt on TextEditingController {
  int get length => text.length;

  void setText(String? pin) {
    text = pin ?? "";
    moveCursorToEnd();
  }

  void delete() {
    if (text.isEmpty) return;
    final pin = text.substring(0, length - 1);
    text = pin;
    moveCursorToEnd();
  }

  void append(String s, int maxLength) {
    if (length == maxLength) return;
    text = '$text$s';
    moveCursorToEnd();
  }

  void moveCursorToEnd() {
    selection = TextSelection.collapsed(offset: length);
  }
}
