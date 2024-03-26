import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../advertisements_info/advertisement_details_page.dart';
import '../data/models/order_response_goal.dart';
import '../../../../common/values/colors.dart';

class OrderCard extends StatefulWidget {
  final List<Data> allRealEstatesResponseBody;
  final int index;

  OrderCard({
    super.key,
    required this.allRealEstatesResponseBody,
    required this.index,
  });

  String getUserType(String Type) {
    switch (Type) {
      case 'seller':
        return 'بائع';
      case 'seller_agent':
        return 'وسيط بائع';
      case 'buyer':
        return 'مشتري';
      case 'buyer_agent':
        return 'وسيط مشتري';
      default:
        ;
        return 'غير معروف';
    }
  }

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isFavorited = true;

  // Initially set to false
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdvertisementDetails(
                id: widget
                    .allRealEstatesResponseBody[widget.index].realEstate!.id
                    .toString(),
                isHisAd: false,
                isHeCanOrder: false,
            isOrdered: true,
            Number: widget.allRealEstatesResponseBody[widget.index].buyer!.phone ?? '00',),
          ),
        );
      },
      child: Container(
          padding: EdgeInsets.only(
            top: 10.h,
          ),
          margin: EdgeInsets.all(10.h),
          height: 197.h,
          width: 370.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
                color: const Color.fromRGBO(243, 244, 246, 1), width: 1.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10.w),
                height: 130.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(243, 244, 245, 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.allRealEstatesResponseBody != null &&
                                  widget.index <
                                      widget
                                          .allRealEstatesResponseBody.length &&
                                  widget
                                          .allRealEstatesResponseBody[
                                              widget.index]
                                          .realEstate !=
                                      null &&
                                  widget
                                          .allRealEstatesResponseBody[
                                              widget.index]
                                          .realEstate!
                                          .images !=
                                      null &&
                                  widget
                                      .allRealEstatesResponseBody[widget.index]
                                      .realEstate!
                                      .images!
                                      .isNotEmpty
                              ? '${widget.allRealEstatesResponseBody[widget.index].realEstate!.images![0].url}'
                              : 'assets/images/placeholder.png',
                          // Use a placeholder image if any of the conditions fail
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null)
                              return child; // Loaded successfully
                            return Image.asset('assets/images/placeholder.png',
                                fit: BoxFit
                                    .cover); // Show placeholder while loading
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/errorload.png',
                                fit: BoxFit.cover); // Show error image
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.h),
                      height: 150.h,
                      width: 225.w,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 99.h,
                            right: 184.w,
                            child: GestureDetector(
                              onTap: () async {
                                // The phone number you want to send the message to (including the country code)
                                String phoneNumber = widget
                                    .allRealEstatesResponseBody![widget.index]
                                    .buyer!
                                    .phone!;

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
                                height: 20.h,
                                width: 20.w,
                                child: Image.asset(
                                  'assets/icons/whatsapp.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'السعر :',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                        color: AppColors
                                            .primarySecondaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                    Text(
                                      '${widget.allRealEstatesResponseBody[widget.index].realEstate!.price} ريال',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'المساحة : ',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                        color: AppColors
                                            .primarySecondaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                    Text(
                                      '250م',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'نوع العقار :',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                        color: AppColors
                                            .primarySecondaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                    Text(
                                      widget
                                              .allRealEstatesResponseBody[
                                                  widget.index]
                                              .realEstate!
                                              .subType ??
                                          "",
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                    )
                                  ],
                                ),
                                if (widget
                                        .allRealEstatesResponseBody![
                                            widget.index]
                                        .realEstate!
                                        .type !=
                                    'land')
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'عمر العقار : ',
                                        style: GoogleFonts.almarai(
                                            textStyle: TextStyle(
                                          color: AppColors
                                              .primarySecondaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                      ),
                                      Text(
                                        '${widget.allRealEstatesResponseBody[widget.index].realEstate!.age} سنوات  ',
                                        style: GoogleFonts.almarai(
                                            textStyle: TextStyle(
                                          color: AppColors.primaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                        )),
                                      )
                                    ],
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('المدينة :',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: AppColors.primarySecondaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Text('${widget.allRealEstatesResponseBody![widget.index].realEstate!.state!.name ?? "غير محدد"}',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: AppColors.primaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('الحي :',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: AppColors.primarySecondaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Text('${widget.allRealEstatesResponseBody![widget.index].realEstate!.city!.name ?? ""}',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: AppColors.primaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end ,
                                  children: [
                                    Text(widget.allRealEstatesResponseBody![widget.index].realEstate!.announcementTime ?? "غير موجود",
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: const Color.fromRGBO(106, 115, 128, 1),
                                            letterSpacing: 0,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],),
              ),
              Container(
                padding: EdgeInsets.only(top: 8.h),
                width: 323.w,
                height: 48.5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.allRealEstatesResponseBody[widget.index].realEstate!.id}',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: const Color.fromRGBO(13, 11, 12, 1),
                                    letterSpacing: 0,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),Text(
                              widget.getUserType(widget.allRealEstatesResponseBody[widget.index].realEstate!.adjectiveAdvertiser ?? ""),
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: const Color.fromRGBO(106, 115, 128, 1),
                                    letterSpacing: 0,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
