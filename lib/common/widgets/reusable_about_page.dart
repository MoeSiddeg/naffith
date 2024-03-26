import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../presentation/screens/application/application_page.dart';
import '../values/colors.dart';
class AboutPage extends StatelessWidget {
  String? titel;
  String ? largText;
  String? supTitel;
  final EdgeInsetsGeometry? margin;
  AboutPage({super.key , required this.titel, required this.largText , required  this.supTitel, required this.margin} );

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop:  false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>const ApplicationPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              size: 30.h,
                              color: AppColors.primaryBackground,
                            )),
                        Container(
                          margin: margin,
                          child: Text(
                            titel!,
                            style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: Image.asset('assets/images/Naffithlogo.png' , fit: BoxFit.cover,),
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 20.h, right: 5.w),
                    child: Text(
                      supTitel!,
                      style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: AppColors.primaryBackground,
                          letterSpacing: 0,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Container(
                padding: EdgeInsets.only(
                    top: 10.h, right: 25.w , left: 25.w),
                child: Text(
                  largText!,
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: AppColors.primaryBackground,
                      letterSpacing: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
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
