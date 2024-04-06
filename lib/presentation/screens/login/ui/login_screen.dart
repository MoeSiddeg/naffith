import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/helpers/spacing.dart';
import '../../../../common/theming/styles.dart';
import '../../../../common/values/colors.dart';
import '../../../../common/widgets/app_text_button.dart';
import '../data/models/login_request_body.dart';
import '../logic/cubit/login_cubit.dart';
import 'widgets/already_have_account_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(6),
                Column(
                  children: [
                    SizedBox(
                      width:250.w,
                      height: 250.h,
                      child: Image.asset(
                        'assets/images/Naffithlogo.png',
                        fit: BoxFit.cover,
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5.w, left: 10.w, bottom: 10.h),
                          child: Text(
                            'تسجيل دخول',
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const EmailAndPassword(),
                    verticalSpace(24),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "دخول",
                      textStyle: GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) async {
    if (context.read<LoginCubit>().formKey.currentState!.validate())  {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
          fcmToken: fcmToken!,
        ),
      );
    }
  }
}
