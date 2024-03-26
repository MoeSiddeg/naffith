import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';
// TODO : add focus border , error border , form widget , formKey and make textController with cubit !
class ReusableFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ReusableFormField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
    this.hintStyle,
    this.style,
    this.padding,
    this.margin,
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
            padding:  EdgeInsets.only(right: 5.h),
            child: Text(
              labelText,
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primaryBackground,
                  letterSpacing: 0,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),

              ),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 335.w,
            height: 50.h,
            margin: EdgeInsets.only(right: 5.h, left: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              obscureText: false,
              decoration: InputDecoration(
                labelText: hintText,
                labelStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 0.5),
                    letterSpacing: 0,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 0.5)
                    ,
                    letterSpacing: 0,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color:const Color.fromRGBO(180, 180, 180, 1),
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(180, 180, 180, 1),
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(10),
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
                contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
              ),
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primarySecondaryBackground,
                  letterSpacing: 0,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: (value){
                return validator!(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

