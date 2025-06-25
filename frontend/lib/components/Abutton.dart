import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? size;
  final Gradient? gradient;
  final Color? color;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.size,
    this.gradient,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(borderRadius ?? 12.r);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: gradient == null ? (color ?? Colors.blue) : null,
          gradient: gradient,
          borderRadius: radius,
        ),
        child: Text(
          text,
          style:
              textStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: size?.sp ?? 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter"
              ),
        ),
      ),
    );
  }
}
