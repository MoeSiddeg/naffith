import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/values/colors.dart';
import '../../advertisements_info/advertisement_details_page.dart';
import '../../my_advertisements_buy_info/logic/chane_status/change_status_cubit.dart';
import '../../my_advertisements_buy_info/widgets/change_status_dialog.dart';

class ContractorsCard extends StatelessWidget {
  String name;
  String phoneNumber;
  String id;
  String realEstateType;
  String orderID;
  String orderStatus;
  ContractorsCard({super.key , required this.name, required this.phoneNumber, required this.id , required this.realEstateType, required this.orderID , required this.orderStatus});

 String status(String status){
   switch (orderStatus){
     case 'complate':
       return 'مكتمل';
     case 'ongoing':
       return " جاري التواصل";
     default:
       return "غير محدد";
   }
 }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => StatefulBuilder(
                builder: (context, setStateSB) => Container(
                    height:
                    MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(children: [
                      /// Header
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '', // Add clear and informative title
                              style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                          letterSpacing: 0,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),


                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    // The phone number you want to send the message to (including the country code)

                                    // The message you want to send
                                    String message = 'مرحبا';

                                    // Construct the WhatsApp URL
                                    String url = 'https://wa.me/$phoneNumber?text=${Uri.parse(message)}';

                                    // Check if the WhatsApp app is installed
                                    if (await canLaunch(url)) {
                                    // Open WhatsApp with the pre-filled message
                                    await launch(url);
                                    } else {
                                    // Handle the case where WhatsApp is not installed
                                    throw 'Could not launch WhatsApp.';
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 20.h),
                                    width: double.infinity,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(23, 56, 61, 1),
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
                                        'تواصل واتساب',
                                        style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AdvertisementDetails(id:id,isHisAd : true, isHeCanOrder: false, isOrdered: false,),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 20.h),
                                    width: double.infinity,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(23, 56, 61, 1),
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
                                        'تفاصيل العقار',
                                        style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(context: context, builder:(BuildContext context) {
                                               return  ChangeStatusAlertDialog(id: orderID,);
                                  });},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 20.h),
                                    width: double.infinity,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(23, 56, 61, 1),
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
                                        'تغيير الحاله',
                                        style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
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
                      ),
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        height: 90.h,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(236, 240, 241, 1),
          border: Border.all(
              color: const Color.fromRGBO(243, 244, 246, 1),
              width: 1.0),
        ),
        child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 10.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name,style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: AppColors.primaryBackground,
                              letterSpacing: 0,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ))),

                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                              color:  orderStatus == "complate" ? const Color.fromRGBO(
                                  55, 205, 55, 0.3) : const Color.fromRGBO(
                                  237, 161, 73, 0.3),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.sp)),
                              border: Border.all(
                                color: orderStatus == "complate" ? Colors.green :
                                const Color.fromRGBO(237, 161, 73, 1), // Set the border color to red
                                width: 1, // Set the border width as desired
                              )
                          ),
                          child: Text(status(orderStatus), style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color:  orderStatus == "complate" ? Colors.green.shade500 :
                              const Color.fromRGBO(237, 161, 73, 0.8),
                              letterSpacing: 0,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400, ),)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(phoneNumber,style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: AppColors.primaryBackground,
                              letterSpacing: 0,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          width: 0.5.w,
                          height: 15.h,
                          color:AppColors.primarySecondaryBackground ,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(id,style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: AppColors.primaryBackground,
                              letterSpacing: 0,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                        SizedBox(
                          width: 2.w,
                        ),
                        Icon(Icons.home , color: AppColors.primaryBackground, size: 20.sp,),
                        Container(
                          width: 0.5.w,
                          height: 15.h,
                          color:AppColors.primarySecondaryBackground ,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(realEstateType,style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: AppColors.primaryBackground,
                              letterSpacing: 0,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

        ]),
      ),
    );
  }
}
