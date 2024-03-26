import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/logic/all_favorites_cubit.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/logic/all_favorites_states.dart';
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';
import 'package:naffith/presentation/screens/home_page/logic/delete_from_favorites/delete_favorites_cubit.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/card_holder.dart';
import '../advertisements_info/advertisement_details_page.dart';
import '../login/ui/login_screen.dart';
import 'widgets/delete_from_favorites_bloc_listener.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();

    context.read<AllFavoritesCubit>().emitAllFavoritesStates();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'المفضلة',
                  style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  )),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
      BlocBuilder<AllFavoritesCubit, AllFavoritesStates>(
        builder: (context, state) {
          return state.when(initial: () {
            return SizedBox(
              height: 812.h * 0.715,
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 10.h),
                  itemCount: 3,
                  //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (context, index) {
                    return const AdvertisementCardPlaceholder();
                  }),

            );
          }, loading: () {
            return  SizedBox(
                height: 812.h * 0.715,
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 10.h),
                    itemCount: 3,
                    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemBuilder: (context, index) {
                      return const AdvertisementCardPlaceholder();
                    }),

            );
          }, success: (AllRealEstatesResponseBody allRealEstatesResponseBody) {
            if(allRealEstatesResponseBody.data!.isEmpty || allRealEstatesResponseBody.data == null) {
              return SizedBox(
                height: 812.h * 0.7,
                child:  Center(
                  child: Text('لا توجد لديك عقارات في المفضلة', style:GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color:
                        AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      )), ),
                ));
}
            return Column(
              children: [
                SizedBox(
                  height: 812.h * 0.79,
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 10.h),
                    itemCount: allRealEstatesResponseBody.data!.length,
                    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemBuilder: (context, index) {
                      return AdvertisementCard(
                          allRealEstatesResponseBody:
                              allRealEstatesResponseBody.data,
                          index: index);
                    },
                  ),
                ),
                SizedBox(
                  height:10.h ,
                    child: const DeleteFromFavoritesBlocListener())
              ],
            );
          }, error: (error) {
            if(error.contains('Unauthenticated')){
              return Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: SizedBox(
                  height: 812.h * 0.4,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                padding: EdgeInsets.only(top: 250.h),
                child: SizedBox(
                    height: 812.h * 0.5,
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
      )
    ]);
  }
}

class AdvertisementCard extends StatefulWidget {
  final List<Data>? allRealEstatesResponseBody;
  final int index;

  const AdvertisementCard({
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
  State<AdvertisementCard> createState() => _AdvertisementCardState();
}

class _AdvertisementCardState extends State<AdvertisementCard> {
  bool isFavorited = true; // Initially set to false
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdvertisementDetails(
                id: widget.allRealEstatesResponseBody![widget.index].id
                    .toString(), isHisAd : true, isHeCanOrder: true, isOrdered: false,),
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
