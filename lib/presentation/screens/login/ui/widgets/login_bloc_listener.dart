import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
