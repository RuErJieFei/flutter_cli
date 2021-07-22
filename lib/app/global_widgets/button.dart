import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cli/utils/index.dart';

import '../data/services/vibration.dart';
import 'anim_button.dart';

// import 'package:auto_size_text/auto_size_text.dart';

class ButtoN extends StatefulWidget {
  ButtoN({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.fontColor,
    this.fontSize,
    this.backgroundColor,
    this.radius,
    this.backgoundColors,
    this.onTap,
    this.group,
    this.child,
    // @required this.tag,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? radius;
  final Function()? onTap;
  final Widget? child;
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final Color? backgroundColor;
  final List<Color>? backgoundColors;
  final Object? group;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<ButtoN> {
  @override
  Widget build(BuildContext context) {
    final color = widget.backgroundColor ?? Theme.of(context).primaryColor;
    return AnimButton(
      group: widget.group,
      onTap: () {
        if (widget.onTap != null) {
          // Vibration.to.tapVibrate();
          widget.onTap!.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(100),
              // color: Colors.black26,
              offset: Offset(0, 0.6),
              blurRadius: 4,
              spreadRadius: 1,
            )
          ],
          borderRadius: widget.radius == null
              ? null
              : BorderRadius.circular(widget.radius!),
          gradient: widget.backgoundColors != null
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.backgoundColors!,
                )
              : null,
        ),
        // padding: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        width: widget.width ?? double.infinity,
        height: widget.height ?? 160.h,
        child: widget.child ??
            Text(
              widget.text ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.fontSize ?? 45.w,
                color: widget.fontColor ?? Colors.white,
              ),
              maxLines: 2,
            ),
      ),
    );
  }
}
