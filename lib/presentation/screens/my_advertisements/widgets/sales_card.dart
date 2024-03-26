import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/advertisements_info/Cubit/one_real_estate_cubit.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../common/values/colors.dart';
import '../../advertisements_info/advertisement_details_page.dart';
import '../../my_advertisements_buy_info/my_advertisement_info_page.dart';
import '../data/models/my_real_estates_model.dart';
class MyAdvertisementSaleCard extends StatefulWidget {
  final List<Data>? allRealEstatesResponseBody;
  final int index;

  const MyAdvertisementSaleCard({
    super.key,
    required this.allRealEstatesResponseBody,
    required this.index,
  });
  String getUserType (String Type) {
    switch (Type) {
      case 'seller':
        return 'مالك';
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
  State<MyAdvertisementSaleCard> createState() => _MyAdvertisementSaleCardState();
}

class _MyAdvertisementSaleCardState extends State<MyAdvertisementSaleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<OneRealEstateCubit>().emitOneRealEstateStates(id: widget.allRealEstatesResponseBody?[widget.index].id.toString() ??'0' );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyAdvertisementsInfoPage(
                id: widget.allRealEstatesResponseBody![widget.index].id
                    .toString()),

          ),
        );
      },
      child: Container(
          padding: EdgeInsets.only(top:10.h ,),
          margin: EdgeInsets.all(10.h),
          height: 197.h,
          width: 370.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: const Color.fromRGBO(243, 244, 246, 1), width: 1.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10.w),
                height: 132.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(243, 244, 245, 1),
                ),
                child: Row(children: [
                  Container(
                    width: 100.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.allRealEstatesResponseBody![widget.index].images?.isNotEmpty ?? false
                            ? widget.allRealEstatesResponseBody![widget.index].images![0].url ?? ""
                            : "", // Accessing the URL only if it's not null and the list is not empty
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null)
                            return child; // Loaded successfully
                          return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover);
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/errorload.png', fit: BoxFit.cover);
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

                        Container(
                          margin: EdgeInsets.all(8.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('السعر :',
                                    style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: AppColors.primarySecondaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                  Text('${widget.allRealEstatesResponseBody![widget.index].price} ريال',
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
                                  Text('المساحة : ',
                                    style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: AppColors.primarySecondaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                  Text('250م',
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
                                  Text('نوع العقار :',
                                    style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: AppColors.primarySecondaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                  Text(widget.allRealEstatesResponseBody![widget.index].subType ?? "",
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

                              if(widget.allRealEstatesResponseBody![widget.index].type != 'land')
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('عمر العقار : ',
                                      style: GoogleFonts.almarai(
                                          textStyle: TextStyle(
                                            color: AppColors.primarySecondaryBackground,
                                            letterSpacing: 0,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Text('${widget.allRealEstatesResponseBody![widget.index].age ?? 0} سنوات ',
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
                                  Text('${widget.allRealEstatesResponseBody![widget.index].state!.name ?? "غير محدد"}',
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
                                  Text('${widget.allRealEstatesResponseBody![widget.index].city!.name ?? ""}',
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
                                  Text(widget.allRealEstatesResponseBody![widget.index].announcementTime ?? "غير موجود",
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
                              '${widget.allRealEstatesResponseBody![widget.index].id}',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: const Color.fromRGBO(13, 11, 12, 1),
                                    letterSpacing: 0,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),Text(
                              widget.getUserType(widget.allRealEstatesResponseBody![widget.index].adjectiveAdvertiser ?? ""),
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