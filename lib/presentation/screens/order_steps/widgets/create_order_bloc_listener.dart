import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:naffith/presentation/screens/application/application_page.dart';
import 'package:naffith/presentation/screens/application/bloc/app_events.dart';
import 'package:naffith/presentation/screens/order_steps/logic/create_order/create_order_cubit.dart';
import 'package:naffith/presentation/screens/order_steps/logic/create_order/create_order_state.dart';
import '../../../../common/values/colors.dart';
import '../../application/bloc/app_blocs.dart';
import '../../my_orders/my_orders_page.dart';
class CreateOrderBlocListener extends StatelessWidget {
  CreateOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrderCubit, CreateOrderStates>(
      listenWhen: (previous, current) =>
       current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryBackground,
                ),
              ),
            );
          },
          success: (data) {
            setupSuccessState(context);
          },
          error: (error) {
            if(error== 'You cannot contract because you are the owner of the advertisement') {
              setupErrorState(context, 'هذا العقار لك ... لا يمكنك طلب هذا العقار');
            }else if(error == "You already contracted"){
              setupErrorState(context, 'تم طلب العقار سابقاً');
            } else{
              setupErrorState(context, 'حدث حطا ما حاول مرة اخرى');
            }
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context , String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            content:
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.w,
                  height: 153.h,
                  child: Image.asset(
                    'assets/images/warning.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  error,
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: const Color.fromRGBO(23, 56, 61, 1),
                      letterSpacing: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 139.w,
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
                          'حسنا',
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
                  ),
                ],
              ),
            ],
          ),
    );
  }

  void setupSuccessState(BuildContext context) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) =>
          PopScope(
            canPop:  false,
         child: AlertDialog(
            content:
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: Image.asset('assets/images/check.png' , fit: BoxFit.contain,),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      //bottom: 70.h  ,
                        top: 20.h),
                    child: Text(
                      "تم طلب العقار بنجاح",
                      style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                            color: AppColors.primaryBackground,
                            letterSpacing: 0,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 60.h, left: 20.w, right: 20.w, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<AppBlocs>().add(const TriggerAppEvent(2));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ApplicationPage()));
                        },
                        child: Container(
                          width: 200.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(144, 117, 60, 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.w)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1))
                              ]),
                          child: Center(
                            child: Text(
                              'طلباتي',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}