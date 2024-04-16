import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/values/colors.dart';
class TicketCard extends StatelessWidget {
  String? name;
  String? status;
  String? type;
   TicketCard({super.key, required this.name , required this.status, required this.type});

  @override
  Widget build(BuildContext context) {
    String? tickedType;
    if(type== "complain"){
      tickedType = "شكوة";
    } else {
      tickedType = "سؤال";
    }
    return GestureDetector(
      onTap: (){
        // showModalBottomSheet(
        //     context: context,
        //     isScrollControlled: true,
        //     backgroundColor: Colors.transparent,
        //     builder: (context) => StatefulBuilder(
        //         builder: (context, setStateSB) => Container(
        //           height:112.h,
        //           width: double.infinity,
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius:  BorderRadius.only(
        //               topLeft: Radius.circular(25.0),
        //               topRight: Radius.circular(25.0),
        //             ),
        //           ),
        //           child: Column(children: [
        //             /// Header
        //             Container(
        //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     '', // Add clear and informative title
        //                     style: GoogleFonts.almarai(
        //                       textStyle: TextStyle(
        //                         color: AppColors.primaryBackground,
        //                         letterSpacing: 0,
        //                         fontSize: 12.sp,
        //                         fontWeight: FontWeight.w400,
        //                       ),
        //                     ),
        //                   ),
        //                   IconButton(
        //                     onPressed: () => Navigator.pop(context),
        //                     icon: const Icon(Icons.close),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //
        //           ],
        //           ),
        //         )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        height: 112.h,

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
                        Text('$name',style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: AppColors.primaryBackground,
                              letterSpacing: 0,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ))),

                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                              color:   const Color.fromRGBO(
                                  237, 161, 73, 0.3),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.sp)),
                              border: Border.all(
                                color:
                                const Color.fromRGBO(237, 161, 73, 1), // Set the border color to red
                                width: 1, // Set the border width as desired
                              )
                          ),
                          child: Text('$status', style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: Color.fromRGBO(237, 161, 73, 0.8),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5.h,left: 10.w),
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.w),
                              ),
                              minimumSize: Size(55.w, 30.h),
                            ),
                            child: Text(
                              '$tickedType',
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 5.h, right: 10.w),
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       // Navigator.pop(context);
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: AppColors.primaryBackground,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(30.w),
                        //       ),
                        //       minimumSize: Size(55.w, 30.h),
                        //     ),
                        //     child: Text(
                        //       'لم يتم الدفع',
                        //       style: GoogleFonts.almarai(
                        //         textStyle: TextStyle(
                        //           color: Colors.white,
                        //           letterSpacing: 0,
                        //           fontSize: 8.sp,
                        //           fontWeight: FontWeight.w700,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ),

            ]),
      ),
    );
  }
}
