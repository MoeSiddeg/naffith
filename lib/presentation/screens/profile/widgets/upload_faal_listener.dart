import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:naffith/presentation/screens/profile/logic/upload_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/upload_faal_states.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../common/theming/colors.dart';
import '../../../../../common/theming/styles.dart';
import '../logic/get_faal_cubit.dart';

class UploadFaalBlocListener extends StatelessWidget {
  const UploadFaalBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadFaalCubit, UploadFaalStates>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (faalResponse) {
            setupSuccess(context,() async{
              await launch(faalResponse.data!.faalDocument!);
            });
            context.read<GetFaalCubit>().emitGetFaalStates();
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
                  Text(
                    error,
                    style:GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(23, 56, 61, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ) ,
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
  void setupSuccess(BuildContext context, Function openUrl) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        title: const SizedBox(),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 150.w,
              height: 153.h,
              child: Image.asset(
                'assets/images/check.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                'تم رفع الرخصة بنجاح',
                style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 1),
                    letterSpacing: 0,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
        actions: [
          Center(
            child: GestureDetector(
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
          ),
          SizedBox(height: 15.h,),
          Center(
            child: GestureDetector(
              onTap: () {
                openUrl();
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
                    'فتح الرابط',
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
          ),
        ],
      ),
    );
  }
}
