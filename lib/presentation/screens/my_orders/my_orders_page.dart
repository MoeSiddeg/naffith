import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contarctors_buy/contractors_buy_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contarctors_buy/contractors_buy_state.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contractors/contractors_state.dart';
import 'package:naffith/presentation/screens/my_orders/logic/my_order_buy/my_order_buy_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/my_order_buy/my_order_buy_state.dart';
import 'package:naffith/presentation/screens/my_orders/logic/order_sale_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/order_sale_state.dart';
import 'package:naffith/presentation/screens/my_orders/widgets/order_card.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/card_holder.dart';
import '../login/ui/login_screen.dart';
import '../my_advertisements/logic/my_real_estates_cubit.dart';
import '../my_advertisements/logic/to_sales/my_real_estates_cubit.dart';
import '../my_advertisements_buy_info/widgets/change_status_bloc_listener.dart';
import 'logic/contractors/contractors_cubit.dart';
import 'widgets/contractors_card.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  void initState() {
    context.read<OrderSaleCubit>().emitOrderSaleStates();
    context.read<MyOrderBuyCubit>().emitMyOrderBuyStates();
    context.read<ContractorCubit>().emitMyOrdersListStates();
    context.read<ContractorBuyCubit>().emitUsersOrdersListStates();
    super.initState();
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
                            'طلباتي',
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
                          height: 812.h * 0.88,
                          child: TabBarView(
                            children: [
                              // TODO inner tap bars for sales - al3rd
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: DefaultTabController(
                                    length: 2,
                                    child: Scaffold(
                                        body: SingleChildScrollView(
                                      child: Column(children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 10.h),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: 812.h * 0.75,
                                                  child: TabBarView(
                                                    children: [
                                                      BlocBuilder<
                                                          OrderSaleCubit,
                                                          OrderSaleState>(
                                                        builder:
                                                            (context, state) {
                                                          return state.when(
                                                              initial: () {
                                                            return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 50
                                                                            .h),
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 10
                                                                                .h,
                                                                            top: 0
                                                                                .h),
                                                                        itemCount:
                                                                            5,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }));
                                                          }, loading: () {
                                                            return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 50
                                                                            .h),
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 20
                                                                                .h,
                                                                            top: 0
                                                                                .h),
                                                                        itemCount:
                                                                            5,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }));
                                                          }, success:
                                                                  (orderResponseGoalSale) {
                                                            if (orderResponseGoalSale
                                                                    .data!
                                                                    .length ==
                                                                0) {
                                                              return Center(
                                                                child: Text(
                                                                  'لا توجد لديك طلبات',
                                                                  style: GoogleFonts
                                                                      .almarai(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .primaryBackground,
                                                                      letterSpacing:
                                                                          0,
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 50
                                                                            .h),
                                                                child: ListView
                                                                    .builder(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          20.h,
                                                                      top: 0.h),
                                                                  itemCount:
                                                                      orderResponseGoalSale
                                                                          .data!
                                                                          .length,
                                                                  //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return OrderCard(
                                                                      allRealEstatesResponseBody:
                                                                          orderResponseGoalSale
                                                                              .data!,
                                                                      index:
                                                                          index,
                                                                    );
                                                                  },
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
                                                      BlocBuilder<
                                                          ContractorCubit,ContractorsState
                                                          >(
                                                        builder:
                                                            (context, state) {
                                                          return state.when(initial:
                                                              () {
                                                            return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          55.h),
                                                              child: SizedBox(
                                                                height: 812.h *
                                                                    0.712,
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 10
                                                                                .h),
                                                                        itemCount:
                                                                            3,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }),
                                                              ),
                                                            );
                                                          }, loading: () {
                                                            return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          55.h),
                                                              child: SizedBox(
                                                                height: 812.h *
                                                                    0.712,
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 10
                                                                                .h),
                                                                        itemCount:
                                                                            3,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }),
                                                              ),
                                                            );
                                                          }, success:
                                                              (OrderResponseGoal
                                                                  myOrderResponse) {
                                                            if (myOrderResponse
                                                                    .data ==
                                                                [] || myOrderResponse.data!.isEmpty) {
                                                              return Center(
                                                                child: Text(
                                                                  'لا توجد لديك عقارات للشراء ',
                                                                  style: GoogleFonts
                                                                      .almarai(
                                                                          textStyle:
                                                                              TextStyle(
                                                                    color: AppColors
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0,
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  )),
                                                                ),
                                                              );
                                                            } else {
                                                              return Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 48
                                                                            .h),
                                                                child: SizedBox(
                                                                  height:
                                                                      812.h *
                                                                          0.712,
                                                                  child: ListView
                                                                      .builder(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                            10.h),
                                                                    itemCount:
                                                                        myOrderResponse
                                                                            .data!
                                                                            .length,
                                                                    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return ContractorsCard(name: myOrderResponse.data![index].buyer!.name ?? "", phoneNumber: myOrderResponse.data![index].buyer!.phone ?? "", id: myOrderResponse.data![index].realEstate!.id.toString(), realEstateType: myOrderResponse.data![index].realEstate!.subType ?? "", orderID: myOrderResponse.data![index].id.toString(),orderStatus: myOrderResponse.data![index].orderStatus ?? "",);
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
                                                    ],
                                                  ),
                                                ),
                                                //Todo the inner tap bar for my sales
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: TabBar(
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Colors
                                                                .transparent),
                                                    dividerColor:
                                                        Colors.transparent,
                                                    labelColor:
                                                        const Color.fromRGBO(
                                                            23, 56, 61, 1),
                                                    physics:
                                                        const ClampingScrollPhysics(),
                                                    unselectedLabelColor:
                                                        const Color.fromRGBO(
                                                            23, 56, 61, 1),
                                                    indicator:
                                                        const UnderlineTabIndicator(
                                                      // Set the underline indicator
                                                      borderSide: BorderSide(
                                                        width: 2,
                                                        color: Color.fromRGBO(
                                                            23, 56, 61, 1),
                                                      ), // Set the desired color
                                                    ),
                                                    tabs: [
                                                      Tab(
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "طلباتي",
                                                            style: GoogleFonts
                                                                .almarai(
                                                              textStyle:
                                                                  TextStyle(
                                                                //  color: AppColors.primaryBackground,
                                                                letterSpacing:
                                                                    0,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Tab(
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "طلبات العملاء",
                                                            style: GoogleFonts
                                                                .almarai(
                                                              textStyle:
                                                                  TextStyle(
                                                                //  color: AppColors.primaryBackground,
                                                                letterSpacing:
                                                                    0,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                    ))),
                              ),
                              // TODO inner taps bar for buys - al6lab
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: DefaultTabController(
                                    length: 2,
                                    child: Scaffold(
                                        body: SingleChildScrollView(
                                      child: Column(children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: 812.h * 0.710,
                                                  child: TabBarView(
                                                    children: [
                                                      BlocBuilder<
                                                              MyOrderBuyCubit,
                                                              MyOrderBuyState>(
                                                          builder:
                                                              (context, state) {
                                                        return state.when(
                                                          initial: () {
                                                            return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 50
                                                                            .h),
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 20
                                                                                .h,
                                                                            top: 0
                                                                                .h),
                                                                        itemCount:
                                                                            5,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }));
                                                          },
                                                          loading: () {
                                                            return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 50
                                                                            .h),
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 20
                                                                                .h,
                                                                            top: 0
                                                                                .h),
                                                                        itemCount:
                                                                            5,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }));
                                                          },
                                                          success:
                                                              (orderResponseGoalSale) {
                                                            if (orderResponseGoalSale
                                                                    .data!
                                                                    .length ==
                                                                0) {
                                                              return Center(
                                                                child: Text(
                                                                  'لا توجد لديك طلبات',
                                                                  style: GoogleFonts
                                                                      .almarai(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .primaryBackground,
                                                                      letterSpacing:
                                                                          0,
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 50
                                                                            .h),
                                                                child: ListView
                                                                    .builder(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          20.h,
                                                                      top: 0.h),
                                                                  itemCount:
                                                                      orderResponseGoalSale
                                                                          .data!
                                                                          .length,
                                                                  //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return OrderCard(
                                                                      allRealEstatesResponseBody:
                                                                          orderResponseGoalSale
                                                                              .data!,
                                                                      index:
                                                                          index,
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          error: (error) {

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
                                                          },
                                                        );
                                                      }),
                                                      BlocBuilder<
                                                          ContractorBuyCubit,
                                                          ContractorsBuyState>(
                                                        builder:
                                                            (context, state) {
                                                          return state.when(initial:
                                                              () {
                                                            return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          55.h),
                                                              child: SizedBox(
                                                                height: 812.h *
                                                                    0.712,
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 10
                                                                                .h),
                                                                        itemCount:
                                                                            3,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }),
                                                              ),
                                                            );
                                                          }, loading: () {
                                                            return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          55.h),
                                                              child: SizedBox(
                                                                height: 812.h *
                                                                    0.712,
                                                                child: ListView
                                                                    .builder(
                                                                        padding: EdgeInsets.only(
                                                                            bottom: 10
                                                                                .h),
                                                                        itemCount:
                                                                            3,
                                                                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const AdvertisementCardPlaceholder();
                                                                        }),
                                                              ),
                                                            );
                                                          }, success:
                                                              (OrderResponseGoal
                                                          myOrderResponse) {
                                                            if (myOrderResponse
                                                                .data ==
                                                                [] || myOrderResponse.data!.isEmpty) {
                                                              return Center(
                                                                child: Text(
                                                                  'لا توجد لديك عقارات للشراء ',
                                                                  style: GoogleFonts
                                                                      .almarai(
                                                                      textStyle:
                                                                      TextStyle(
                                                                        color: AppColors
                                                                            .primaryBackground,
                                                                        letterSpacing:
                                                                        0,
                                                                        fontSize:
                                                                        14.sp,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                      )),
                                                                ),
                                                              );
                                                            } else {
                                                              return Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    top: 48
                                                                        .h),
                                                                child: SizedBox(
                                                                  height:
                                                                  812.h *
                                                                      0.712,
                                                                  child: ListView
                                                                      .builder(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                        10.h),
                                                                    itemCount:
                                                                    myOrderResponse
                                                                        .data!
                                                                        .length,
                                                                    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                                    itemBuilder:
                                                                        (context,
                                                                        index) {
                                                                      return ContractorsCard(name: myOrderResponse.data![index].buyer!.name ?? "", phoneNumber: myOrderResponse.data![index].buyer!.phone ?? "", id: myOrderResponse.data![index].realEstate!.id.toString(), realEstateType: myOrderResponse.data![index].realEstate!.subType ?? "", orderID: myOrderResponse.data![index].id.toString(),orderStatus: myOrderResponse.data![index].orderStatus ?? "",);
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          },error: (error) {

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
                                                    ],
                                                  ),
                                                ),
                                                //Todo the inner tap bar for my sales
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: TabBar(
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Colors
                                                                .transparent),
                                                    dividerColor:
                                                        Colors.transparent,
                                                    labelColor:
                                                        const Color.fromRGBO(
                                                            23, 56, 61, 1),
                                                    physics:
                                                        const ClampingScrollPhysics(),
                                                    unselectedLabelColor:
                                                        const Color.fromRGBO(
                                                            23, 56, 61, 1),
                                                    indicator:
                                                        const UnderlineTabIndicator(
                                                      // Set the underline indicator
                                                      borderSide: BorderSide(
                                                        width: 2,
                                                        color: Color.fromRGBO(
                                                            23, 56, 61, 1),
                                                      ), // Set the desired color
                                                    ),
                                                    tabs: [
                                                      Tab(
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "طلباتي",
                                                            style: GoogleFonts
                                                                .almarai(
                                                              textStyle:
                                                                  TextStyle(
                                                                //  color: AppColors.primaryBackground,
                                                                letterSpacing:
                                                                    0,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Tab(
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "طلبات العملاء",
                                                            style: GoogleFonts
                                                                .almarai(
                                                              textStyle:
                                                                  TextStyle(
                                                                //  color: AppColors.primaryBackground,
                                                                letterSpacing:
                                                                    0,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                        //Todo the outer tap bar
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
                ]),
              const  ChangeStatusBlocListener()
              ],
            ),
          ),
        ));
  }
}
