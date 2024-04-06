import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/report/logic/report_cubit.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/common/widgets/interface_container.dart';
import 'package:naffith/presentation/screens/advertisements_info/Cubit/one_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/advertisements_info/Cubit/one_real_estate_states.dart';
import 'package:naffith/presentation/screens/order_steps/order_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/report/widget/report_real_estates_bloc_listener.dart';
import '../../../common/widgets/login_alert.dart';
import '../../../global.dart';
import '../my_advertisements_buy_info/widgets/update_note_dialog.dart';
import 'widgets/carousel_slides.dart';

class AdvertisementDetails extends StatefulWidget {
  bool isHisAd;
  bool isHeCanOrder;
  bool isOrdered;
  String Number;
  String id;

  AdvertisementDetails(
      {super.key,
      required this.id,
      required this.isHisAd,
      required this.isHeCanOrder,
      required this.isOrdered,
      this.Number = '00'});

  @override
  State<AdvertisementDetails> createState() => _AdvertisementDetailsState();
}

class _AdvertisementDetailsState extends State<AdvertisementDetails> {
  @override
  void initState() {
    super.initState();

    context.read<OneRealEstateCubit>().emitOneRealEstateStates(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneRealEstateCubit, OneRealEstateStates>(
        builder: (context, state) {
      return state.when(initial: () {
        return const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryBackground,
        ));
      }, loading: () {
        return const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryBackground,
        ));
      }, success: (oneRealEstateResponse) {
        String userType;
        switch (oneRealEstateResponse.data!.adjectiveAdvertiser) {
          case 'seller':
            userType = 'مالك';
          case 'seller_agent':
            userType = "وسيط بائع";
          case 'buyer':
            userType = "مشتري";
          case 'buyer_agent':
            userType = "وسيط مشتري";
          default:
            userType = "غير معروف";
        }
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              ImageCarouselSlider(
                images: oneRealEstateResponse.data!.images ?? [],
                id: widget.id,
              ),
              SizedBox(
                height: 0.h,
              ),
              Container(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  margin: EdgeInsets.all(10.h),
                  width: 372.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromRGBO(243, 244, 246, 1),
                        width: 1.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تفاصيل العقار',
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Text(
                                oneRealEstateResponse.data!.subType ??
                                    "لا يوجد",
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: AppColors.primaryBackground,
                                    letterSpacing: 0,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              "${oneRealEstateResponse.data!.price ?? "لا يوجد"} ريال",
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.only(right: 10.w),
                          width: 335.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(243, 244, 245, 1),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(right: 10.w),
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
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.w),
                                            child: Text(
                                              "الوصف",
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
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.w),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 2.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 300.w,
                                                    child: TextFormField(
                                                      maxLines: null,
                                                      initialValue:
                                                          oneRealEstateResponse
                                                                  .data!.note ??
                                                              "",
                                                      readOnly: true,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: TextStyle(
                                                          color: AppColors
                                                              .primaryBackground,
                                                          letterSpacing: 0,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5.w),
                                                  child: Text(
                                                    oneRealEstateResponse.data!
                                                            .announcementTime ??
                                                        "لا يوجد",
                                                    style: GoogleFonts.almarai(
                                                      textStyle: TextStyle(
                                                        color: AppColors
                                                            .primaryBackground,
                                                        letterSpacing: 0,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              height: 35.h,
                              width: 35.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryBackground),
                              child: Center(
                                  child: Text(
                                '1',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ))),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text('الموقع',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              )))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: 27.w, top: 10.h, bottom: 10.h),
                            child: Container(
                              height: 30.h,
                              width: 1,
                              color: AppColors.primarySecondaryBackground,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 38.w, bottom: 18.h),
                            child: Text(
                              '${oneRealEstateResponse.data!.state!.name ?? "لا يوجد"} , ${oneRealEstateResponse.data!.city!.name ?? "لا يوجد"}',
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color:
                                      const Color.fromRGBO(106, 115, 128, 0.6),
                                  letterSpacing: 0,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              height: 35.h,
                              width: 35.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryBackground),
                              child: Center(
                                  child: Text(
                                '2',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ))),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text('صفة المعلن',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              )))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: 27.w, top: 10.h, bottom: 10.h),
                            child: Container(
                              height: 30.h,
                              width: 1,
                              color: AppColors.primarySecondaryBackground,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 38.w, bottom: 18.h),
                            child: Text(
                              userType ?? "لا يوجد",
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color:
                                      const Color.fromRGBO(106, 115, 128, 0.6),
                                  letterSpacing: 0,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              height: 35.h,
                              width: 35.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryBackground),
                              child: Center(
                                  child: Text(
                                '3',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ))),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text('رقم العقار',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              )))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 80.w, bottom: 18.h),
                            child: Text(
                              oneRealEstateResponse.data!.id.toString() ??
                                  "لا يوجد",
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color:
                                      const Color.fromRGBO(106, 115, 128, 0.6),
                                  letterSpacing: 0,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ////////////////////
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              height: 35.h,
                              width: 35.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryBackground),
                              child: Center(
                                  child: Text(
                                '4',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ))),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text('حالة العقار',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              )))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 80.w, bottom: 18.h),
                            child: Text(
                              context.read<OneRealEstateCubit>().statusInArabic,
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color:
                                      const Color.fromRGBO(106, 115, 128, 0.6),
                                  letterSpacing: 0,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (widget.isHeCanOrder == true)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (Global.storageService.getIsLoggedIn()) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => OrderPage(
                                        id: widget.id,
                                      ),
                                    ),
                                  );
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const LoginAlertDialog();
                                      });
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 20.h, left: 20.h, bottom: 10.h),
                                width: 160.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(23, 56, 61, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.w)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: const Offset(0, 1))
                                    ]),
                                child: Center(
                                  child: Text(
                                    'طلب العقار',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 10.w, top: 10.h, bottom: 10.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (widget.isHisAd == false) ...[
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ChangePrivateNoteAlertDialog(
                                              id: '${oneRealEstateResponse.data!.id}',
                                            );
                                          });
                                    },
                                    icon: Icon(
                                      Icons.block,
                                      color: Colors.red,
                                      size: widget.isHisAd ? 0 : 30.sp,
                                    ))
                              ],
                              if (widget.isOrdered == true) ...[
                                GestureDetector(
                                  onTap: () async {
                                    // The phone number you want to send the message to (including the country code)
                                    String phoneNumber = widget.Number;

                                    // The message you want to send
                                    String message = 'مرحبا';

                                    // Construct the WhatsApp URL
                                    String url =
                                        'https://wa.me/$phoneNumber?text=${Uri.parse(message)}';

                                    // Check if the WhatsApp app is installed
                                    if (await canLaunch(url)) {
                                      // Open WhatsApp with the pre-filled message
                                      await launch(url);
                                    } else {
                                      // Handle the case where WhatsApp is not installed
                                      throw 'Could not launch WhatsApp.';
                                    }
                                  },
                                  child: SizedBox(
                                    height: 30.h,
                                    width: 30.w,
                                    child: Image.asset(
                                      'assets/icons/whatsapp.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ]),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                      const ReportRealEstatesBlocListener(),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  margin: EdgeInsets.all(10.h),
                  width: 372.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(23, 56, 61, 0.05),
                    border: Border.all(
                        color: const Color.fromRGBO(243, 244, 246, 1),
                        width: 1.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تفاصيل اخرى',
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20.h, right: 5.w, left: 5.w, bottom: 15.h),
                        width: 370.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'عدد الشوارع',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse
                                              .data!.numberStreets ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "عرض الشوارع",
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      '${oneRealEstateResponse.data!.streetSpaces ?? "0"}  م',
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'عدد غرف النوم',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse
                                              .data!.numberBedrooms ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'عدد الحمامات',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse
                                              .data!.numberBedrooms ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "الدور",
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse.data!.floor ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "عدد الدور",
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse
                                              .data!.numberFloors ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'هل يوجد عداد كهرباء ؟',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse
                                              .data!.electricityMeter ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' هل يوجد عداد مياه ؟',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse.data!.waterMeter ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.6),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'الواجهة',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  // TODO ADD A LIST VIEW FOR INTER FACE
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  // TODO ADD A LIST VIEW FOR INTER FACE
                                  SizedBox(
                                    height: 30.h,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: oneRealEstateResponse
                                            .data!.interface!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(left: 5.w),
                                            child: InterFaceContainer(
                                                title: oneRealEstateResponse
                                                    .data!.interface![index]),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h, right: 10.w),
                              margin: EdgeInsets.only(top: 5.h),
                              width: 372.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 1.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'عمر العقار بالسنة',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.h, right: 5.w, bottom: 5.h),
                                    child: Text(
                                      oneRealEstateResponse.data!.age ??
                                          "لا يوجد",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                              106, 115, 128, 0.9),
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
      }, error: (error) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.red,
        ));
      });
    });
  }
}
