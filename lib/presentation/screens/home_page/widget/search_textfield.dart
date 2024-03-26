import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';
// TODO : add focus border , error border , form widget , formKey and make textController with cubit !
class ReusableFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function(String)? onChanged; // Added onChanged callback

  const ReusableFormField({
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
    this.hintStyle,
    this.style,
    this.padding,
    this.margin,
    this.onChanged, // Added onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 280.w,
            height: 40.h,
            margin: EdgeInsets.only(right: 5.h, left: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(23, 56, 61, 0.1),
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: controller,
              focusNode: focusNode,
              obscureText: false,
              onChanged: onChanged, // Pass onChanged callback
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search, size: 20.sp),
                labelStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 0.5),
                    letterSpacing: 0,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 0.5),
                    letterSpacing: 0,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0x00000000),
                    width: 2.sp,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                EdgeInsetsDirectional.fromSTEB(20.w, 10.h, 0, 12.h),
              ),
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primaryText,
                  letterSpacing: 0,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: (value) {
                return validator!(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}


