import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final bool isCentered;

  const AText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.style,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? (isCentered ? TextAlign.center : TextAlign.start),
      maxLines: maxLines,
      overflow: overflow,
      style:
          style ??
          TextStyle(
            fontSize: size?.sp ?? 14.sp,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color ?? Colors.black,
            height: 1.4,
            fontFamily: 'Inter'
          ),
    );
  }
}
