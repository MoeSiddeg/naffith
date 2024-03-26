import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/social_media_page/Cubit/social_media_cubit.dart';
import 'package:naffith/presentation/screens/social_media_page/Cubit/social_media_states.dart';
import 'package:naffith/presentation/screens/social_media_page/widgets/social_media_view.dart';
import 'package:shimmer/shimmer.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/holder.dart';
import '../application/application_page.dart';

class SocialMediaPage extends StatefulWidget {
  const SocialMediaPage({super.key});

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  @override
  void initState() {
    super.initState();
    context.read<SocialMediaCubit>().emitSocialMediaStates();
  }
  // Controllers for each TextField
  final _msgController = TextEditingController();
  // FocusNodes for each TextField
  final _msgFocusNode = FocusNode();

  // Validators for each TextField
  String? _msgValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء ادخال البيانات';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaCubit, SocialMediaStates>(
        builder: (context, state) {
      return state.when(initial: () {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryBackground,
          ),
        );

      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryBackground,
          ),
        );
      }, success: (socialMediaResponseBody) {
        if(socialMediaResponseBody.socialMedia ==null || socialMediaResponseBody.socialMedia! == []){
          return Column(

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
                          margin: EdgeInsets.only(right: 90.h, left: 70.h),
                          child: Text(
                            'تواصل معنا',
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
              SizedBox(height: 150.h,),
              Center(
                child: Text('لا توجد بيانات',   style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: AppColors.primaryBackground,
                      letterSpacing: 0,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    )),),
              ),
            ],
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: PopScope(
                canPop:  false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                                margin: EdgeInsets.only(right: 90.h, left: 70.h),
                                child: Text(
                                  'تواصل معنا',
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
                    Column(
                      children: [
                        SocialMediaView(
                          imagePath: 'assets/icons/x.png',
                          text: ' منصة X',
                          url: socialMediaResponseBody.socialMedia!.x,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SocialMediaView(
                          imagePath: 'assets/icons/whatsapp.png',
                          text: 'واتساب',
                          url: 'https://wa.me/050555555',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SocialMediaView(
                          imagePath: 'assets/icons/tik-tok.png',
                          text: 'تيك توك',
                          url: socialMediaResponseBody.socialMedia!.tiktok,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SocialMediaView(
                          imagePath: 'assets/icons/snapchat.png',
                          text: 'سناب شات',
                          url: socialMediaResponseBody.socialMedia!.snapchat,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SocialMediaView(
                            imagePath: 'assets/icons/youtube.png',
                            text: 'يوتيوب',
                            url: socialMediaResponseBody.socialMedia!.youtube),
                        SizedBox(
                          height: 10.h,
                        ),
                        SocialMediaView(
                          imagePath: 'assets/icons/facebook.png',
                          text: 'فيسبوك',
                          url: socialMediaResponseBody.socialMedia!.facebook,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SocialMediaView(
                          imagePath: 'assets/icons/gmail.png',
                          text: 'إيميل',
                          url: socialMediaResponseBody.socialMedia!.email,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SocialMediaView(
                          imagePath: 'assets/icons/call.png',
                          text: ' جوال',
                          url: socialMediaResponseBody.socialMedia!.phone,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Container(
              //                 padding: EdgeInsets.only(
              //                     top: 20.h, right: 5.w),
              //                 child: Text(
              //                   'مباشر عن طريق التطبيق :',
              //                   style: GoogleFonts.almarai(
              //                     textStyle: TextStyle(
              //                       color: AppColors.primaryBackground,
              //                       letterSpacing: 0,
              //                       fontSize: 15.sp,
              //                       fontWeight: FontWeight.w700,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 5.h),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Container(
              //                 padding: EdgeInsets.only(
              //                     top: 10.h, bottom: 10.h ,right: 5.w),
              //                 child: Text(
              //                   'الرسالة',
              //                   style: GoogleFonts.almarai(
              //                     textStyle: TextStyle(
              //                       color: AppColors.primaryBackground,
              //                       letterSpacing: 0,
              //                       fontSize: 14.sp,
              //                       fontWeight: FontWeight.w700,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 5.h),
              //           Padding(
              //             padding: EdgeInsets.only(right: 5.w , left: 5.w),
              //             child: TextFormField(
              //               controller: _msgController ,
              // // Pass the controller
              //               focusNode: _msgFocusNode ,
              // // Pass the focusNode
              //               style: GoogleFonts.almarai(
              //                 textStyle: TextStyle(
              //                   color: AppColors.primarySecondaryBackground,
              //                   letterSpacing: 0,
              //                   fontSize: 16.sp,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               maxLines: 3,
              //               decoration: InputDecoration(
              // //contentPadding: EdgeInsets.only(right: 5.w , left: 5.w),
              //                 hintText: 'الرسالة',
              //                 hintStyle: GoogleFonts.almarai(
              //                   textStyle: TextStyle(
              //                     color: const Color.fromRGBO(23, 56, 61, 0.5),
              //                     letterSpacing: 0,
              //                     fontSize: 10.sp,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide:
              //                   const BorderSide(color: AppColors.primaryBackground, width: 1),
              //                 ),
              //               ),
              //               validator: _msgValidator,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 20.h,
              //           ),
              //           Center(
              //             child: Column(
              //               children: [
              //                 GestureDetector(
              //                   onTap: () {
              //
              //                   },
              //                   child: Container(
              //                     margin: EdgeInsets.only(
              //                         top: 10.h, left: 60.w, right: 60.w, bottom: 15.h),
              //                     width: 239.w,
              //                     height: 52.h,
              //                     decoration: BoxDecoration(
              //
              //                         color: const Color.fromRGBO(23, 56, 61, 1),
              //                         borderRadius: BorderRadius.all(
              //                             Radius.circular(30.w)),
              //                         boxShadow: [
              //                           BoxShadow(
              //                               color: Colors.grey
              //                                   .withOpacity(0.1),
              //                               spreadRadius: 1,
              //                               blurRadius: 2,
              //                               offset: const Offset(0, 1))
              //                         ]),
              //                     child: Center(
              //                       child: Text(
              //                         'إرسال',
              //                         style: GoogleFonts.almarai(
              //                           textStyle: TextStyle(
              //                             color: Colors.white,
              //                             letterSpacing: 0,
              //                             fontSize: 18.sp,
              //                             fontWeight: FontWeight.w700,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }, error: (error) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      });
    });
  }
}
