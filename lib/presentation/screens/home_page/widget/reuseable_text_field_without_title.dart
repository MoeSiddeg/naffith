import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';
// TODO : add focus border , error border , form widget , formKey and make textController with cubit !
class ReusableFormFieldWithOutTitle extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextInputType keyboardType;

  const ReusableFormFieldWithOutTitle({
    required this.labelText,
    this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
    this.hintStyle,
    this.style,
    this.padding,
    this.margin,
    required this.keyboardType
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
            width: 162.w,
            height: 48.h,
            margin: EdgeInsets.only(right: 5.h, left: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: Colors.transparent,
            ),
            child: TextFormField(
              keyboardType: keyboardType,
              cursorColor: Colors.black,
              controller: controller,
              focusNode: focusNode,
              obscureText: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: GoogleFonts.almarai(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(23, 56, 61, 0.5),
                    letterSpacing: 0,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                enabledBorder:OutlineInputBorder(
                  borderSide: const BorderSide(
                    color:Color.fromRGBO(180, 180, 180, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(180, 180, 180, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(180, 180, 180, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color:Color.fromRGBO(180, 180, 180, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
              ),
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primaryText,
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

