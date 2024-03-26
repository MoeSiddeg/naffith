import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/widgets/change_to_buy_bloc_listener.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/widgets/change_to_sale_bloc_listener.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/widgets/delete_real_estate_bloc_listener.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/widgets/update_note_bloc_listener.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/widgets/update_note_dialog.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/interface_container.dart';
import '../advertisements_info/Cubit/one_real_estate_cubit.dart';
import '../advertisements_info/Cubit/one_real_estate_states.dart';
import '../advertisements_info/widgets/carousel_slides.dart';
import 'logic/update_note/update_note_cubit.dart';
import 'widgets/change_ads_status_dialog.dart';

class MyAdvertisementsInfoPage extends StatefulWidget {
  String? id;

  MyAdvertisementsInfoPage({super.key, required this.id});

  @override
  State<MyAdvertisementsInfoPage> createState() => _MyAdvertisementsInfoPageState();
}

class _MyAdvertisementsInfoPageState extends State<MyAdvertisementsInfoPage> {
  late String privateNote;
  bool isEdit = true;
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    privateNote = "";

  }
  @override
  void dispose() {
   isEdit = false;
    super.dispose();
  }

  void updatePrivateNoteLocally(String newPrivateNote) {
    setState(() {
      privateNote = newPrivateNote;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<OneRealEstateCubit, OneRealEstateStates>(
                  builder: (context, state) {
                return state.when(initial: () {
                  return Column(
                    children: [
                      SizedBox( height: 200.h,),
                      const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryBackground,
                      )),
                    ],
                  );
                }, loading: () {
                  return Column(
                    children: [
                      SizedBox( height: 400.h,),
                      const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBackground,
                          )),
                    ],
                  );
                }, success: (oneRealEstateResponse) {

                  String userType;
                  switch (oneRealEstateResponse.data!.adjectiveAdvertiser){
                    case 'seller':
                      userType= 'بائع';
                    case 'seller_agent':
                      userType = "وسيط بائع";
                    case 'buyer':
                      userType ="";
                    case 'buyer_agent':
                      userType = "وسيط مشتري";
                    default:
                      userType = "غير معروف";
                  }
                  return Column(
                      children: [
                        ImageCarouselSlider(
                            images: oneRealEstateResponse.data!.images ?? [],
                        id: widget.id!,),
                        SizedBox(
                          height: 15.h,
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
                                              color:
                                                  AppColors.primaryBackground,
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
                                      color: const Color.fromRGBO(
                                          243, 244, 245, 1),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            width: 335.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color.fromRGBO(
                                                  243, 244, 245, 1),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(right: 0.w),
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
                                                          padding:  EdgeInsets.only(left:8.w),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: 2.w),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    // Text(
                                                                    //   oneRealEstateResponse.data!.note ?? "",
                                                                    //   style: GoogleFonts.almarai(
                                                                    //     textStyle: TextStyle(
                                                                    //       color:
                                                                    //       AppColors.primaryBackground,
                                                                    //       letterSpacing: 0,
                                                                    //       fontSize: 14.sp,
                                                                    //       fontWeight: FontWeight.w300,
                                                                    //     ),
                                                                    //   ),
                                                                    // ),
                                                                    SizedBox(
                                                                      width: 300.w,
                                                                      child :TextFormField(
                                                                        maxLines: null,
                                                                        focusNode: _focusNode,
                                                                        initialValue: oneRealEstateResponse.data!.note ?? "",
                                                                        readOnly: true,
                                                                        decoration: const InputDecoration(
                                                                          border: InputBorder.none,
                                                                        ),
                                                                        style: GoogleFonts.almarai(
                                                                          textStyle: TextStyle(
                                                                            color: AppColors.primaryBackground,
                                                                            letterSpacing: 0,
                                                                            fontSize: 14.sp,
                                                                            fontWeight: FontWeight.w300,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(left: 5.w),
                                                                    child: Text(
                                                                      oneRealEstateResponse
                                                                          .data!.announcementTime ??
                                                                          "لا يوجد",
                                                                      style: GoogleFonts.almarai(
                                                                        textStyle: TextStyle(
                                                                          color: AppColors
                                                                              .primaryBackground,
                                                                          letterSpacing: 0,
                                                                          fontSize: 12.sp,
                                                                          fontWeight: FontWeight.w400,
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
                                        color: AppColors
                                            .primarySecondaryBackground,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 38.w, bottom: 18.h),
                                      child: Text(
                                        '${oneRealEstateResponse.data!.state!.name ?? "لا يوجد"} , ${oneRealEstateResponse.data!.city!.name ?? "لا يوجد"}',
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
                                        color: AppColors
                                            .primarySecondaryBackground,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 38.w, bottom: 18.h),
                                      child: Text(
                                        userType,
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
                                      padding: EdgeInsets.only(
                                          right: 80.w, bottom: 18.h),
                                      child: Text(
                                        " ${oneRealEstateResponse.data!.id ?? "لا يوجد"}",
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
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  padding: EdgeInsets.only(right: 10.w),
                                  width: 335.w,
                              //    height: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(
                                        243, 244, 245, 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(padding: EdgeInsets.only(right: 10.w),
                                        child: Row(
                                          children: [
                                            Text('حالة العقار', style: GoogleFonts.almarai(
                                              textStyle: TextStyle(
                                                  color: AppColors.primaryBackground,
                                                  letterSpacing: 0,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700, ),)),
                                           SizedBox(width: 15.w,),
                                              Container(
                                                padding: EdgeInsets.all(3.sp),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        55, 205, 55, 0.3) ,
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(5.sp)),
                                                      border: Border.all(
                                                        color: Colors.green, // Set the border color to red
                                                        width: 1, // Set the border width as desired
                                                      )
                                                  ),
                                                // TODO CHECK SALE STATUS WITH BASIL
                                                child: Text(context.read<OneRealEstateCubit>().statusInArabic, style: GoogleFonts.almarai(
                                                  textStyle: TextStyle(
                                                    color: Colors.green,
                                                    letterSpacing: 0,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w500, ),)),
                                              ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ChangeAdsStatusDialog(widget.id);
                                              });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: 20.h,
                                              right: 20.w,
                                              left: 20.w,
                                              bottom: 20.h),
                                          width: 60.w,
                                          height: 32.h,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  23, 56, 61, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.w)),
                                              ),
                                          child: Center(
                                            child: Text(
                                              'تغيير',
                                              style: GoogleFonts.almarai(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 0,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:335.w,
                                    padding: EdgeInsets.only(right: 10.w , bottom: 0.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                      const Color.fromRGBO(243, 244, 245, 1),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 2.h),
                                              child: Text(
                                                "الملاحظات الخاصة :",
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
                                            if(isEdit== true)
                                            Padding(
                                              padding: EdgeInsets.only(top: 2.h),
                                              child: IconButton(
                                                  onPressed: (){
                                                // showDialog(
                                                //     context: context,
                                                //     builder: (BuildContext context) {
                                                //       return ChangePrivateNoteAlertDialog(id: widget.id!,
                                                //         initialPrivateNote: privateNote,
                                                //         onUpdatePrivateNote: updatePrivateNoteLocally,);
                                                //     });
                                                    setState(() {
                                                      isEdit = !isEdit;
                                                      print(isEdit);
                                                    });
                                                    if (isEdit) {
                                                      FocusScope.of(context).requestFocus(_focusNode);
                                                    }
                                              }, icon: Icon(Icons.edit, size: 22.sp,)),
                                            ),
                                            if(isEdit == false)
                                              Padding(
                                                padding: EdgeInsets.only(top: 2.h),
                                                child: IconButton(
                                                    onPressed: (){
                                                      // showDialog(
                                                      //     context: context,
                                                      //     builder: (BuildContext context) {
                                                      //       return ChangePrivateNoteAlertDialog(id: widget.id!,
                                                      //         initialPrivateNote: privateNote,
                                                      //         onUpdatePrivateNote: updatePrivateNoteLocally,);
                                                      //     });
                                                      context.read<UpdateNoteCubit>().emitUpdateNoteStates(
                                                          widget.id, privateNote);
                                                      setState(() {
                                                        isEdit = !isEdit;
                                                        print(isEdit);
                                                      });

                                                    }, icon: Icon(Icons.check, size: 22.sp,)),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(left:8.w),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(left:8.w),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2.w),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                          width: 300.w,
                                                          child :TextFormField(
                                                            onChanged: (value){
                                                              privateNote = value;
                                                            },

                                                            maxLines: null,

                                                           autofocus: isEdit,
                                                           // controller: _textEditingController,
                                                            focusNode: _focusNode,
                                                            initialValue: oneRealEstateResponse.data!.privateNote ?? "",
                                                            readOnly: isEdit,
                                                            decoration: const InputDecoration(
                                                              border: InputBorder.none,
                                                            ),
                                                            style: GoogleFonts.almarai(
                                                              textStyle: TextStyle(
                                                                color: AppColors.primaryBackground,
                                                                letterSpacing: 0,
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.w300,
                                                              ),
                                                            ),
                                                          ),
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ],
                                    )
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const UpdateNoteBlocListener(),
                                const DeleteRealEstateBlocListener(),
                                 ChangeToSaleBlocListener(id: oneRealEstateResponse.data!.id.toString(),),
                                 ChangeToBuyBlocListener(id: oneRealEstateResponse.data!.id.toString(),),
                              ],
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            padding: EdgeInsets.only(top:10.h ,),
                            margin: EdgeInsets.all(10.h),
                            width: 372.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(23, 56, 61, 0.05),
                              border: Border.all(color: const Color.fromRGBO(243, 244, 246, 1), width: 1.0),
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
                                              child: Text(
                                                oneRealEstateResponse.data!.numberStreets ??
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
                                              child:Text(
                                                '${oneRealEstateResponse.data!.streetSpaces ?? "0"} م',
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
                                              child:   Text(
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
                                              ),)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
                                              child: Text(
                                                oneRealEstateResponse.data!.numberFloors ??
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
                                              child:  Text(
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                           SizedBox(
                                             height: 30.h,
                                             child: ListView.builder(
                                                 scrollDirection: Axis.horizontal,
                                                 itemCount: oneRealEstateResponse.data!.interface!.length  ,
                                                 itemBuilder: (context, index){
                                                   return Padding(
                                                     padding:  EdgeInsets.only(left: 5.w),
                                                     child: InterFaceContainer(title: oneRealEstateResponse.data!.interface![index]),
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
                                        padding: EdgeInsets.only(
                                            top: 5.h, right: 10.w
                                        ),
                                        margin: EdgeInsets.only(top :5.h),
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
                                              'عمر العقار',
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
                                                  top: 5.h, right: 5.w , bottom: 5.h
                                              ),
                                              child:     Text(
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
                    );
                }, error: (error) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                });
              }),

            ],
          ),
        ),
      ),
    );
  }
}
