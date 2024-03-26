import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/login/logic/cubit/login_cubit.dart';
import '../../../common/di/dependency_injection.dart';
import '../../../common/values/constant.dart';
import '../../../global.dart';
import '../application/application_page.dart';
import '../login/ui/login_screen.dart';
import '../sign_in/sign_in.dart';
import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_events.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(23, 56, 61, 1),
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        ' قائمة الممتلكات الخاصة بك!',
                        " احصل على مشترين معتمدين لممتلكاتك",
                        " من خلال لوحة تحكم سهلة الإدارة!",
                        ),
                    _page(
                        2,
                        context,
                        "ابحث عن عقارك المثالي!",
                        "قم بالتصفية العقار حسب الموقع والنوع",
                        "والسعر وتصل إلى البائع مباشرة!",
                        ),
                    _page(
                      3,
                      context,
                      "ابحث عن عقارك المثالي!",
                      "قم بالتصفية العقار حسب الموقع والنوع",
                      "هي لل البيع فقط !",
                    ),
                  ],
                ),
                Positioned(
                  left: 160.w,
                  top: 685.h,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 2,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(

                          color: Colors.white,
                          activeColor: Colors.white,
                          size: const Size.square(10.0),
                          activeSize: const Size(35.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String title,
      String subTitle, String subTitleTwo,) {
    return Container(
      color: const Color.fromRGBO(23, 56, 61, 1),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:42.h, left: 27.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                    if(Global.storageService.getIsLoggedIn()){
                      Global.storageService.setBool(
                          AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>ApplicationPage(),
                        ),
                      );
                    } else {
                      Global.storageService.setBool(
                          AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>SignIn(),
                        ),
                      );
                    }
                    },
                    child: Text(
                      'تخطي',
                      style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            width:250.w,
            height: 250.h,
            child: Image.asset(
              'assets/images/Naffithlogo.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:67.h, left: 10.w),
            child: Text(
              title,
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10.h, left: 10.w , bottom: 78.h  ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      subTitle,
                      style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    Text(
                      subTitleTwo,
                      style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ],
                ),
              )),
         SizedBox(
           height: 25.h,
         ),
         GestureDetector(
                onTap: () {
                  //within 0-2 index
                  if (index < 3) {
                    //animation
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    Global.storageService.setBool(
                        AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                    bool isLoggedin = Global.storageService.getIsLoggedIn();
                    if(isLoggedin){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ApplicationPage()
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                            const SignIn()),

                      );
                    }
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
                  width: 239.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      'التالي',
                      style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(23, 56, 61, 1),
                          letterSpacing: 0,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

          ]),

    );
  }
}
