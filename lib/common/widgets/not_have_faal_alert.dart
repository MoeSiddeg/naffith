import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:naffith/presentation/screens/login/ui/login_screen.dart';
import 'package:naffith/presentation/screens/profile/profile_page.dart';

import '../values/colors.dart';

class AddFaalAlertDialog extends StatefulWidget {

  @override
  State<AddFaalAlertDialog> createState() => _MyAlertDialogState();

  const AddFaalAlertDialog({super.key});

}

class _MyAlertDialogState extends State<AddFaalAlertDialog> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 335.w,
            padding: EdgeInsets.only(left: 10.h),
            child:Center(
              child: Text('عليك رفع رخصة فال اولاََ', style:GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primaryBackground,
                  letterSpacing: 0,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ) ,) ,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h,left: 10.w),
              child: ElevatedButton(
                onPressed: () {
                  context.pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  minimumSize: Size(90.w, 40.h),
                ),
                child: Text(
                  'رفع رخصة فال',
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h, right: 10.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  minimumSize: Size(100.w, 40.h),
                ),
                child: Text(
                  'إلغاء',
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}