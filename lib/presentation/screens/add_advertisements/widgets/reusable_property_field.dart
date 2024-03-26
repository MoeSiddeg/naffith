import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';

class ReusablePropertyField extends StatefulWidget {
  final String label;
  final String hint;
  final int maxLines;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  ReusablePropertyField({
    required this.label,
    required this.hint,
    this.maxLines = 4,
    required this.padding,
    required this.margin,
    required this.controller,

    required this.validator,
  });

  @override
  State<ReusablePropertyField> createState() => _ReusablePropertyFieldState();
}

class _ReusablePropertyFieldState extends State<ReusablePropertyField> {
  final BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15.sp),
    color: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: AppColors.primaryBackground,
                letterSpacing: 0,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            overflow: TextOverflow.ellipsis,
          ),
           SizedBox(height: 5.h),
          TextFormField(
            controller: widget.controller,
            // Pass the controller
            // Pass the focusNode
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: AppColors.primaryText,
                letterSpacing: 0,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: Color.fromRGBO(23, 56, 61, 0.5),
                  letterSpacing: 0,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColors.primaryBackground, width: 1),
              ),
            ),
            validator: widget.validator!,
          )
        ],
      ),
    );
  }
}
