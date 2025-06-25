import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/utils/constants.dart';

class ATextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool isObscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;

  const ATextField({
    super.key,
    required this.hintText,
    this.icon,
    this.isObscure = false,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(fontSize: 12.sp,fontFamily: "Inter"),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600,fontFamily: "Inter"),
        prefixIcon: icon != null
            ? Icon(icon, size: 20.sp, color: Colors.grey.shade600)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade700, width: 1.w),
        ),
      ),
    );
  }
}
