import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyek_anilo/data_layer/consts/Sizes.dart';

class MyContainer extends StatelessWidget {
  MyContainer(
      {Key? key,
      this.child,
      this.borderRadius,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.backgroundColor,
      this.boxBorder})
      : super(key: key);

  final Widget? child;
  final double? width, height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final BoxBorder? boxBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.fromLTRB(size_normal, 0, size_normal, 0),
      padding: padding ?? EdgeInsets.fromLTRB(size_normal, 0, size_normal, 0),
      child: child,
      // color: Colors.white,
      decoration: BoxDecoration(
          border: boxBorder,
          color: backgroundColor ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(size_normal)),
    );
  }
}
