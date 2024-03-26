import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';

import '../application/application_page.dart';
import '../login/ui/login_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 194.w,
                  height: 210.h,
                  child: Image.asset('assets/images/Naffithlogo.png'),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Center(
            child: Text('تسجيل الدخول عن طريق',
                style: GoogleFonts.almarai(
                  textStyle:  TextStyle(
                    color: AppColors.primaryBackground  ,
                    letterSpacing: 0,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ))),
        SizedBox(
          height: 15.h,
        ),
        Container(
            padding: EdgeInsets.only(right: 10.w , bottom: 10.h),
            width: 335.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
              const Color.fromRGBO(243, 244, 245, 1),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: Text(
                        "ملاحظة قبل تسجيل الدخول عن طريق نفاذ",
                        style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                            color: AppColors
                                .primaryBackground,
                            letterSpacing: 0,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding:  EdgeInsets.only(left:0.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                                               "• حذف الاعلان عند البيع أو الشراء",
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color:
                                  AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 5.w,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "• دفع رسوم التطبيق و قدرها 500 ريال بلا من / 0.05% بمناسة الافتتاح",
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color:
                                AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "• الإلتزام بالانظمة و القوانين الصادرة من الجهات المعنية",
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color:
                                AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                            activeColor: const Color.fromRGBO(23, 56, 61, 1),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Text(
                            'التعهد للدخول عن طريق نفاذ  ',
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            )
                            ],
                      )
                    ],
                  ),
                )
              ],
            )),
        SizedBox(
          height: 25.h,
        ),
        Visibility(
          visible: isChecked,
          child: GestureDetector(
            onTap: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
            builder: (context) =>
                const LoginScreen()),

              );
          },
              child: Container(
                alignment: Alignment.center,
                height: 42.h,
                width: 315.w,
                padding:  EdgeInsets.only(left: 50.h, right: 50.h ,),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(144, 117, 60, 1),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('تسجيل عن طريق نفاذ',
                        style: GoogleFonts.almarai(
                          textStyle:  TextStyle(
                            color: Colors.white,
                            letterSpacing: 0,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(
                      height: 30.h,
                      width:  30.h,
                      child: Image.asset('assets/icons/nafazicon.png'),
                    ),
                  ],
                )),
              ),
             ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Center(
            child: Text('أو',
                style: GoogleFonts.almarai(
                  textStyle:  TextStyle(
                    color: AppColors.primaryBackground  ,
                    letterSpacing: 0,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ))),
        SizedBox(
          height: 15.h,
        ),
        GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 42.h,
              width: 315.w,
              padding:  EdgeInsets.only(left: 50.h, right: 50.h ,),
              decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                  child: Text('الدخول كضيف',
                      style: GoogleFonts.almarai(
                        textStyle:  TextStyle(
                          color:Colors.white  ,
                          letterSpacing: 0,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ))),
            ),
            onTap: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ApplicationPage(),
                ),
              );

            })
      ],
    );
  }
}
