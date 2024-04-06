import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/add_advertisements/add_advertisement_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/add_options/add_option_page.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/my_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/my_real_estates_states.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/to_sales/my_real_to_sale_states.dart';
import 'package:naffith/presentation/screens/my_advertisements/widgets/sales_card.dart';
import 'package:naffith/presentation/screens/profile/logic/get_faal_cubit.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/card_holder.dart';
import '../../../common/widgets/login_alert.dart';
import '../../../common/widgets/not_have_faal_alert.dart';
import '../../../global.dart';
import '../login/ui/login_screen.dart';
import '../my_advertisements_buy_info/my_advertisement_info_page.dart';
import 'data/models/my_real_estates_model.dart';
import 'logic/to_sales/my_real_estates_cubit.dart';

class MyAdvertisements extends StatefulWidget {
  @override
  State<MyAdvertisements> createState() => _MyAdvertisementsState();
}

class _MyAdvertisementsState extends State<MyAdvertisements> {
  @override
  void initState() {
    super.initState();

    context.read<MyRealEstatesCubit>().emitMyRealEstatesBuyStates();
    context.read<MyRealEstatesToSaleCubit>().emitMyRealEstatesSalesStates();
    context.read<GetFaalCubit>().emitGetFaalStates();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 70.h, left: 70.h),
                          child: Text(
                            'إعلاناتي',
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
                  const Divider(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Stack(children: [
                        SizedBox(
                          height: 812.h * 0.712,
                          child: TabBarView(children: [
                            BlocBuilder<MyRealEstatesToSaleCubit,
                                MyRealEstatesToSaleStates>(
                              builder: (context, state) {
                                return state.when(initial: () {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 55.h),
                                    child: SizedBox(
                                      height: 812.h * 0.712,
                                      child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          itemCount: 3,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return const AdvertisementCardPlaceholder();
                                          }),
                                    ),
                                  );
                                }, loading: () {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 55.h),
                                    child: SizedBox(
                                      height: 812.h * 0.712,
                                      child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          itemCount: 3,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return const AdvertisementCardPlaceholder();
                                          }),
                                    ),
                                  );
                                }, success: (MyRealEstatesResponse
                                    myRealEstatesRespones) {
                                  if  (myRealEstatesRespones.data!.isEmpty || myRealEstatesRespones.data == null) {
                                    return Padding(
                                      padding:  EdgeInsets.only( top: 105.h),
                                      child: Center(
                                        child: Text(
                                          'لا توجد لديك عقارات',
                                          style: GoogleFonts.almarai(
                                              textStyle: TextStyle(
                                                color: AppColors.primaryBackground,
                                                letterSpacing: 0,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ),
                                      ),
                                    );
                                  }  else {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 48.h),
                                      child: SizedBox(
                                        height: 812.h * 0.712,
                                        child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          itemCount: myRealEstatesRespones
                                              .data!.length,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return MyAdvertisementSaleCard(
                                                allRealEstatesResponseBody:
                                                    myRealEstatesRespones.data,
                                                index: index);
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                }, error: (error) {

                                  if(error.contains('Unauthenticated')){
                                    return Padding(
                                      padding: EdgeInsets.only(top: 255.h),
                                      child: SizedBox(
                                        height: 812.h * 0.712,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'عليك تسجيل الدخول اولاً',
                                                style: GoogleFonts.almarai(
                                                    textStyle: TextStyle(
                                                      color:
                                                      AppColors.primaryBackground,
                                                      letterSpacing: 0,
                                                      fontSize: 18.sp,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                                },
                                                child: Container(
                                                  width: 180.w,
                                                  height: 42.h,
                                                  decoration: BoxDecoration(
                                                      color: const Color.fromRGBO(
                                                          144, 114, 60, 1),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.w)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(0.1),
                                                            spreadRadius: 1,
                                                            blurRadius: 2,
                                                            offset: const Offset(
                                                                0, 1))
                                                      ]),
                                                  child: Center(
                                                    child: Text(
                                                      'تسجيل الدخول',
                                                      style: GoogleFonts.almarai(
                                                        textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: 0,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else{
                                    return Padding(
                                      padding: EdgeInsets.only(top: 255.h),
                                      child: SizedBox(
                                        height: 812.h * 0.712,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'حدث خطأ ما ',
                                                style: GoogleFonts.almarai(
                                                    textStyle: TextStyle(
                                                      color:
                                                      AppColors.primaryBackground,
                                                      letterSpacing: 0,
                                                      fontSize: 18.sp,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<MyRealEstatesCubit>()
                                                      .emitMyRealEstatesBuyStates();
                                                },
                                                child: Container(
                                                  width: 180.w,
                                                  height: 42.h,
                                                  decoration: BoxDecoration(
                                                      color: const Color.fromRGBO(
                                                          23, 56, 61, 1),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.w)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(0.1),
                                                            spreadRadius: 1,
                                                            blurRadius: 2,
                                                            offset: const Offset(
                                                                0, 1))
                                                      ]),
                                                  child: Center(
                                                    child: Text(
                                                      'حاول مرة اخرى',
                                                      style: GoogleFonts.almarai(
                                                        textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: 0,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                        ),
                                                      ),
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
                                });
                              },
                            ),
                            BlocBuilder<MyRealEstatesCubit,
                                MyRealEstatesStates>(
                              builder: (context, state) {
                                return state.when(
                                    initial: () {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 55.h),
                                    child: SizedBox(
                                      height: 812.h * 0.712,
                                      child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          itemCount: 3,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return const AdvertisementCardPlaceholder();
                                          }),
                                    ),
                                  );
                                }, loading: () {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 55.h),
                                    child: SizedBox(
                                      height: 812.h * 0.712,
                                      child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          itemCount: 3,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return const AdvertisementCardPlaceholder();
                                          }),
                                    ),
                                  );
                                }, success: (MyRealEstatesResponse
                                    myRealEstatesRespones) {
                                  if  (myRealEstatesRespones.data!.isEmpty || myRealEstatesRespones.data == null) {
                                    return Padding(
                                      padding:  EdgeInsets.only( top: 105.h),
                                      child: Center(
                                        child: Text(
                                          'لا توجد لديك عقارات',
                                          style: GoogleFonts.almarai(
                                              textStyle: TextStyle(
                                            color: AppColors.primaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                          )),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return  Padding(
                                      padding: EdgeInsets.only(top: 48.h),
                                      child: SizedBox(
                                        height: 812.h * 0.712,
                                        child: ListView.builder(
                                          padding:
                                          EdgeInsets.only(bottom: 10.h),
                                          itemCount: myRealEstatesRespones
                                              .data!.length,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return MyAdvertisementSaleCard(
                                                allRealEstatesResponseBody:
                                                myRealEstatesRespones.data,
                                                index: index);
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                }, error: (error) {
                                 if(error.contains('Unauthenticated')){
                                   return Padding(
                                     padding: EdgeInsets.only(top: 255.h),
                                     child: SizedBox(
                                       height: 812.h * 0.712,
                                       child: Center(
                                         child: Column(
                                           children: [
                                             Text(
                                               'عليك تسجيل الدخول اولاً',
                                               style: GoogleFonts.almarai(
                                                   textStyle: TextStyle(
                                                     color:
                                                     AppColors.primaryBackground,
                                                     letterSpacing: 0,
                                                     fontSize: 18.sp,
                                                     fontWeight: FontWeight.w700,
                                                   )),
                                             ),
                                             SizedBox(
                                               height: 25.h,
                                             ),
                                             GestureDetector(
                                               onTap: () {
                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                               },
                                               child: Container(
                                                 width: 180.w,
                                                 height: 42.h,
                                                 decoration: BoxDecoration(
                                                     color: const Color.fromRGBO(
                                                         144, 114, 60, 1),
                                                     borderRadius:
                                                     BorderRadius.all(
                                                         Radius.circular(
                                                             30.w)),
                                                     boxShadow: [
                                                       BoxShadow(
                                                           color: Colors.grey
                                                               .withOpacity(0.1),
                                                           spreadRadius: 1,
                                                           blurRadius: 2,
                                                           offset: const Offset(
                                                               0, 1))
                                                     ]),
                                                 child: Center(
                                                   child: Text(
                                                     'تسجيل الدخول',
                                                     style: GoogleFonts.almarai(
                                                       textStyle: TextStyle(
                                                         color: Colors.white,
                                                         letterSpacing: 0,
                                                         fontSize: 18.sp,
                                                         fontWeight:
                                                         FontWeight.w700,
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                   );
                                 } else{
                                   return Padding(
                                     padding: EdgeInsets.only(top: 255.h),
                                     child: SizedBox(
                                       height: 812.h * 0.712,
                                       child: Center(
                                         child: Column(
                                           children: [
                                             Text(
                                               'حدث خطأ ما ',
                                               style: GoogleFonts.almarai(
                                                   textStyle: TextStyle(
                                                     color:
                                                     AppColors.primaryBackground,
                                                     letterSpacing: 0,
                                                     fontSize: 18.sp,
                                                     fontWeight: FontWeight.w700,
                                                   )),
                                             ),
                                             GestureDetector(
                                               onTap: () {
                                                 context
                                                     .read<MyRealEstatesCubit>()
                                                     .emitMyRealEstatesBuyStates();
                                               },
                                               child: Container(
                                                 width: 180.w,
                                                 height: 42.h,
                                                 decoration: BoxDecoration(
                                                     color: const Color.fromRGBO(
                                                         23, 56, 61, 1),
                                                     borderRadius:
                                                     BorderRadius.all(
                                                         Radius.circular(
                                                             30.w)),
                                                     boxShadow: [
                                                       BoxShadow(
                                                           color: Colors.grey
                                                               .withOpacity(0.1),
                                                           spreadRadius: 1,
                                                           blurRadius: 2,
                                                           offset: const Offset(
                                                               0, 1))
                                                     ]),
                                                 child: Center(
                                                   child: Text(
                                                     'حاول مرة اخرى',
                                                     style: GoogleFonts.almarai(
                                                       textStyle: TextStyle(
                                                         color: Colors.white,
                                                         letterSpacing: 0,
                                                         fontSize: 18.sp,
                                                         fontWeight:
                                                         FontWeight.w700,
                                                       ),
                                                     ),
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
                                });
                              },
                            ),
                          ]),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 315.h,
                            height: 38.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromRGBO(23, 56, 61, 0.1),
                            ),
                            child: TabBar(
                              // overlayColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                              dividerColor: Colors.transparent,
                              labelColor: Colors.white,
                              physics: const ClampingScrollPhysics(),
                              unselectedLabelColor:
                                  const Color.fromRGBO(23, 56, 61, 1),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromRGBO(23, 56, 61, 1)),
                              tabs: [
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "العرض",
                                        style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            //  color: AppColors.primaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "الطلب",
                                        style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            //  color: AppColors.primaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 16.sp,
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
                        )
                      ])),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      checkLoginAndNavigate(context);
                    },
                    child: Container(
                      width: 239.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(23, 56, 61, 1),
                          borderRadius: BorderRadius.all(Radius.circular(30.w)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1))
                          ]),
                      child: Center(
                        child: Text(
                          'إضافة إعلان',
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
                ]),
              ],
            ),
          ),
        ));
  }
  // Assuming Global.storageService.getIsLoggedIn returns a Future<bool>

  Future<void> checkLoginAndNavigate(BuildContext context) async {
    bool isLoggedIn = await Global.storageService.getIsLoggedIn();
    bool hasFaal = context.read<GetFaalCubit>().isHaveFaal;

    print("isLoggedIn: $isLoggedIn");
    print("hasFaal: $hasFaal");

    if (isLoggedIn && hasFaal) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const OptionPage(),
        ),
      );
    } else if (isLoggedIn && !hasFaal) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddFaalAlertDialog();
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoginAlertDialog();
        },
      );
    }
  }

}


////////////////////////////////////////////////////////////////////////////////////////
