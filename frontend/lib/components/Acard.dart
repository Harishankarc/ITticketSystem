import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ACard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? color;
  final Gradient? gradient;

  const ACard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.margin,
    this.onTap,
    this.border,
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? 16.r);

    return Padding(
      padding: margin ?? EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
      child: Material(
        color: Colors.transparent,
        elevation: 0.25,
        borderRadius: radius,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Container(
            width: width,
            height: height,
            padding: padding ?? EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: gradient == null ? (color ?? Colors.white) : null,
              gradient: gradient,
              borderRadius: radius,
              border: border,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
