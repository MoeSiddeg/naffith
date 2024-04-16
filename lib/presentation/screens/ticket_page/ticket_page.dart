import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/users_data/Cubit/get_users_cubit.dart';
import 'package:naffith/common/users_data/Cubit/get_users_state.dart';
import 'package:naffith/presentation/screens/ticket_page/data/models/all_tickets_response_body.dart';
import 'package:naffith/presentation/screens/ticket_page/logic/add_ticket_cubit.dart';
import 'package:naffith/presentation/screens/ticket_page/widget/old_ticket_card.dart';
import 'package:naffith/presentation/screens/ticket_page/widget/reusable_property_field.dart';

import '../../../common/values/colors.dart';

import '../../../common/values/constants_design.dart';
import '../../../common/widgets/card_holder.dart';
import '../add_advertisements/widgets/large_drop_down.dart';
import '../login/ui/login_screen.dart';
import 'logic/all_tickets/all_tickets_cubit.dart';
import 'logic/all_tickets/all_tickets_state.dart';
import 'widget/add_ticket_bloc_listener.dart';
import 'widget/checkbox_search_list.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _commentsController = TextEditingController();

  String? _commentsValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'يجب كتابت رسالة';
    }
    return null;
  }

  final List<String> items = ['حدث خطاء'];
  final _commentsFocusNode = FocusNode();

  @override
  void initState() {
    context.read<GetUsersCubit>().emitGetUsersStates();
    context.read<AllTicketsCubit>().emitAllTicketsStates();
    super.initState();
  }
  String? selectedType;
  String? tickedType;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:  SafeArea(
        child: Container(
          color: kBackgroundColor,
          child: Column(children: [
              Container(
                color: kBackgroundColor,
                padding: EdgeInsets.only(top: 5.h, bottom: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 30.h,
                          color: AppColors.primaryBackground,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 113.w),
                      child: Text(
                        'البلاغات',
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
                height: 812.h * 0.855,
                child: TabBarView(children: [
                  Scaffold(
                    body: Padding(
                      padding: EdgeInsets.only(top: 45.h),
                      child: SingleChildScrollView(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(right: 0.w, bottom: 20.h , left: 0.w),
                              child: LargeTypeDropdown(selectedValue: selectedType, textWidgetString: 'النوع', items: ['شكوة',"سؤال"], onChanged: (String? value) {

                                setState(() {
                                  selectedType= value;
                                  if(value== "شكوة"){
                                    tickedType = "complain";
                                  } else {
                                    tickedType = "enquiry";
                                  }
                                });
                              },),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 25.w, bottom: 20.h),
                                  child: Text(
                                    'اختر العميل الذي تم التعامل معه : ',
                                    style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<GetUsersCubit, GetUsersStates>(
                              builder: (context, state) {
                                return state.when(initial: () {
                                  return const CircularProgressIndicator();
                                }, loading: () {
                                  return const CircularProgressIndicator();
                                }, success: (usersResponseBody) {
                                  return CheckboxListWithSearch(
                                    usersNames: context.read<GetUsersCubit>().usersNames ,    onItemSelected: (selectedItem) {
                                    context.read<GetUsersCubit>().getUserID(name: selectedItem);
                                  },);
                                }, error: (error) {
                                  return const Center(
                                    child: Text('حدث خطاء ما'),
                                  );
                                });
                              },
                            ),
                            Form(
                              key: formKey,
                              child: Padding(
                                padding: EdgeInsets.all(12.0.sp),
                                child: MessageTextField(
                                  label: 'الرسالة',
                                  hint: 'الرسالة',
                                  padding: EdgeInsets.only(
                                      right: 5.h, left: 10.h, bottom: 15.h, top: 25.h),
                                  margin: const EdgeInsets.all(0),
                                  controller: _commentsController,
                                  focusNode: _commentsFocusNode,
                                  validator: _commentsValidator,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
                              child: ElevatedButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate() && context.read<GetUsersCubit>().userId !=0 && tickedType != null){
                                    context.read<AddTicketCubit>().emitAddTicketStates(msg: _commentsController.text, agentId: context.read<GetUsersCubit>().userId, type: tickedType!);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:  Text('الرجاء التأكد من جميع البيانات'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBackground,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.w),
                                  ),
                                  minimumSize: Size(120.w, 40.h),
                                ),
                                child: Text(
                                  'إرسال',
                                  style: GoogleFonts.almarai(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                    ),
                  ),
            Padding(
                padding: EdgeInsets.only(top: 45.h),
                child:BlocBuilder<AllTicketsCubit, AllTicketsStates>(
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
                    }, success: (AllTicketsResponseBody allRealEstatesResponseBody) {
                      if(allRealEstatesResponseBody.data!.isEmpty || allRealEstatesResponseBody.data == null) {
                        return SizedBox(
                            height: 812.h * 0.7,
                            child:  Center(
                              child: Text('لا توجد لديك بلاغات', style:GoogleFonts.almarai(
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
                                  return TicketCard(name: allRealEstatesResponseBody.data![index].agent!.name ?? "", status: 'غير محددة', type: allRealEstatesResponseBody.data![index].type,);
                                },
                              ),
                            ),


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
            )
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
                              "بلاغ جديد",
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
                              "البلاغات السابقة",
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  //  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 12.sp,
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
              ),
            const  AddTicketBlocListener()
            ]),
          ),
               ] ),
        ),
        )

    );
  }
}
