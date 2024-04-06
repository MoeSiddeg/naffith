import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/comman_questions_page/Cubit/comman_questions_cubit.dart';
import 'package:naffith/presentation/screens/notifications/notifications_page.dart';
import 'package:naffith/presentation/screens/privacy_policy_page/Cubit/privay_policy_cubit.dart';
import 'package:naffith/presentation/screens/privacy_policy_page/privacy_policy_page.dart';
import 'package:naffith/presentation/screens/user_terms_page/Cubit/user_terms_cubit.dart';
import 'package:naffith/presentation/screens/user_terms_page/user_terms_page.dart';
import '../../../common/di/dependency_injection.dart';
import '../../../common/values/colors.dart';
import '../../../common/values/constant.dart';
import '../../../common/widgets/login_alert.dart';
import '../../../global.dart';
import '../about_us_page/Cubit/about_us_cubit.dart';
import '../about_us_page/about_us_page.dart';
import '../comman_questions_page/comman_questions_page.dart';
import '../login/logic/cubit/login_cubit.dart';
import '../login/ui/login_screen.dart';
import '../profile/profile_page.dart';
import '../social_media_page/Cubit/social_media_cubit.dart';
import '../social_media_page/soical_media_screen.dart';
import '../ticket_page/ticket_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15.h, bottom: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 138.w,
                ),
                Text(
                  'الإعدادات',
                  style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  )),
                ),
                SizedBox(
                  width: 113.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()));
                      },
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration:const BoxDecoration (
                          shape: BoxShape.circle,
                          color: AppColors.primaryFourthElementText,
                        ),
                        child: Icon(Icons.notifications_none, size: 27.sp, color: AppColors.primaryBackground,),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 15.h,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        'معلومات حسابي : ',
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
                GestureDetector(
                  onTap: (){
                    if(Global.storageService.getIsLoggedIn()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    }else{
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LoginAlertDialog();
                          });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10.h, right: 20.h, left: 20.h, bottom: 10.h),
                    width: 370.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(23, 56, 61, 0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: AppColors.primaryBackground,
                                size: 30.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: Text(
                                'الملف الشخصي',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: AppColors.primaryBackground,
                                    letterSpacing: 0,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_left_sharp,
                          color: AppColors.primaryBackground,
                          size: 30.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        'معلومات عامة : ',
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
                Container(
                  margin: EdgeInsets.only(
                      top: 20.h, right: 20.h, left: 20.h, bottom: 20.h),
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  width: 370.w,
                  height: 230.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(23, 56, 61, 0.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlocProvider(
                                      create: (context) => getIt<AboutUsCubit>(),
                                      child:  const AboutUsPage()),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: SizedBox(
                                    height: 25.h,
                                    width: 25.w,
                                    child: Icon(FontAwesomeIcons.exclamationCircle,
                                      color: AppColors.primaryBackground,)
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: Text(
                                    'عن نفّذ',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: AppColors.primaryBackground,
                              size: 30.sp,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlocProvider(
                                      create: (context) => getIt<CommanQuestionsCubit>(),
                                      child:  const CommanQuestionsPage()),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child:SizedBox(
                                    height: 25.h,
                                    width: 25.w,
                                    child: Icon(FontAwesomeIcons.questionCircle,
                                      color: AppColors.primaryBackground,),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: Text(
                                    'الأسلة الشائعة',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: AppColors.primaryBackground,
                              size: 30.sp,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SocialMediaPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: SizedBox(
                                    height: 25.h,
                                    width: 25.w,
                                    child: Icon(FontAwesomeIcons.message, size: 20.sp,)
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: Text(
                                    'تواصل معنا',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: AppColors.primaryBackground,
                              size: 30.sp,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlocProvider(
                                      create: (context) => getIt<PrivacyPolicyCubit>(),
                                      child:   const PrivacyPolicyPage()),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: Icon(FontAwesomeIcons.shieldHalved,
                                    color: AppColors.primaryBackground,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: Text(
                                    'سياسة الخصوصية',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: AppColors.primaryBackground,
                              size: 30.sp,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlocProvider(
                                      create: (context) => getIt<UserTermsCubit>(),
                                      child:  const UserTermsPage()),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.w),
                                    child: Icon(
                                     FontAwesomeIcons.children,
                                      color: AppColors.primaryBackground
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.w),
                                    child: Text(
                                      'الشروط والأحكام',
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: AppColors.primaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_left_sharp,
                                color: AppColors.primaryBackground,
                                size: 30.sp,
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        'البلاغات: ',
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
                GestureDetector(
                  onTap: (){
                    if(Global.storageService.getIsLoggedIn()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TicketPage(),
                        ),
                      );
                    }else{
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LoginAlertDialog();
                          });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10.h, right: 20.h, left: 20.h, bottom: 005.h),
                    width: 370.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(23, 56, 61, 0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Icon(
                              FontAwesomeIcons.ticket,
                                color: AppColors.primaryBackground,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: Text(
                                ' البلاغات',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: AppColors.primaryBackground,
                                    letterSpacing: 0,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_left_sharp,
                          color: AppColors.primaryBackground,
                          size: 30.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    // TODO add a calculate page
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProfilePage(),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10.h, right: 20.h, left: 20.h, bottom: 20.h),
                    width: 370.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(23, 56, 61, 0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Icon(
                                FontAwesomeIcons.calculator,
                                color: AppColors.primaryBackground,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: Text(
                                ' حاسبة - حسابات التطبيق',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: AppColors.primaryBackground,
                                    letterSpacing: 0,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_left_sharp,
                          color: AppColors.primaryBackground,
                          size: 30.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'نسخة التطبيق : 1.0 V',
                      style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                            color: const Color.fromRGBO(80, 80, 80, 1),
                            letterSpacing: 0,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                    Global.storageService.remove(AppConstants.STORAGE_USER_NAME);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 5.h, left: 60.w, right: 60.w, bottom: 5.h),
                    width: 239.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 60, 59, 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(30.w)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1))
                        ]),
                    child: Center(
                      child: Text(
                        'تسجيل خروج',
                        style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ]
    );
  }
}
