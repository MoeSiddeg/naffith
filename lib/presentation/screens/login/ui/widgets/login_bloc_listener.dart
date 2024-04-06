import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:naffith/presentation/screens/application/application_page.dart';

import '../../../../../common/theming/colors.dart';
import '../../../../../common/theming/styles.dart';
import '../../../../../common/values/constant.dart';
import '../../../../../global.dart';
import '../../../application/bloc/app_blocs.dart';
import '../../../application/bloc/app_events.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
          success: (loginResponse) {
            Global.storageService.setString(AppConstants. STORAGE_USER_TOKEN_KEY, loginResponse.accessToken.toString());
            Global.storageService.setString(AppConstants. STORAGE_USER_NAME, loginResponse.user.name ?? "");
            print("......my token is ${loginResponse.accessToken}.......");
            print("......my name is ${loginResponse.user.name}.......");
            context.read<AppBlocs>().add(const TriggerAppEvent(0));
            context.pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>const ApplicationPage(),
              ),
            );
          },
          error: (error) {
            String msg = '';
            if( error == 'user not found'){
              msg = 'الإيميل غير مسجل' ;
            } else if(error == "password not correct"){
              msg =  'كلمة المرور غير صحيحة';
            }
            setupErrorState(context, msg);
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
        content: Column(
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
}
