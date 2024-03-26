import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class InterFaceContainer extends StatelessWidget {
  String title;
   InterFaceContainer({super.key ,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.sp),
      height: 20.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(144, 117, 60, 1),
        borderRadius: BorderRadius.circular(20.sp)
    ),
      child: Center(
        child: Text(
          title ?? "", style: GoogleFonts.almarai(
          textStyle: TextStyle(
            fontSize: 12.sp,
                color: Colors.white
          )
        ),
        ),
      ),
    );
  }
}
