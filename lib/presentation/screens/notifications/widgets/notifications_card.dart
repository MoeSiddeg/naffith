import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';

class NotificationsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final VoidCallback onTap;

  const NotificationsCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0, // Remove shadow
        margin: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(8.0),
          horizontal: ScreenUtil().setWidth(16.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.5), // Add border color
            width: 1.0, // Add border width
          ),
        ),
        child: ListTile(
          leading: Container(
              height: 35.h,
              width: 35.w,
              decoration:const BoxDecoration (
                shape: BoxShape.circle,
                color: AppColors.primaryFourthElementText,
              ),
              child: Icon(icon, color: AppColors.primaryBackground, size: 30.sp,)),
          title: Text(
            title,
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: AppColors.primaryBackground,
                letterSpacing: 0,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: ScreenUtil().setHeight(4.0)),
              Text(
                subtitle,
                style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(4.0)),
              Text(
                time,
                style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
