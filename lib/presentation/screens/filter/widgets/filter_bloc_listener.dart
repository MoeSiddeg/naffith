import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:naffith/presentation/screens/filter/filter_page.dart';
import 'package:naffith/presentation/screens/filter/logic/filter_cubit.dart';
import 'package:naffith/presentation/screens/filter/logic/filter_state.dart';

import '../../../../common/theming/colors.dart';
import '../../../../common/theming/styles.dart';

class FilterBlocListener extends StatelessWidget {
  const FilterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EstateFilterCubit, EstateFilterState>(
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
            context.pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage()));
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
