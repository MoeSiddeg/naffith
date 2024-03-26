import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/home_page/logic/delete_from_favorites/delete_favorites_cubit.dart';

import '../../home_page/logic/delete_from_favorites/delete_favorites_state.dart';
import '../logic/all_favorites_cubit.dart';
class DeleteFromFavoritesBlocListener extends StatelessWidget {
  const DeleteFromFavoritesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteFavoritesCubit, DeleteFavoritesState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {

          },
          success: () {
            context.read<AllFavoritesCubit>().emitAllFavoritesStates();
          },
          error: (error) {

          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
