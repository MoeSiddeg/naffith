import 'package:naffith/presentation/screens/add_advertisements/data/models/add_real_estates_request_model.dart';
import 'dart:io';
import '../data/repos/add_real_estates_repo.dart';
import 'add_real_estates_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddRealEstatesCubit extends Cubit<AddRealEstatesState> {
  final AddRealEstatesRepo _addRealEstatesRepo;
  AddRealEstatesCubit(this._addRealEstatesRepo) : super(const AddRealEstatesState.initial());

  void emitAddRealEstateStates(AddRealEstatesRequest addRealEstatesRequest, List<File> images) async {
    emit( AddRealEstatesState.loading());
    final response = await _addRealEstatesRepo.addRealEstates(addRealEstatesRequest, images);
    response.when(success: (addRealEstatesResponseBody) {
      emit(AddRealEstatesState.success(addRealEstatesResponseBody));
    }, failure: (error) {
      emit(AddRealEstatesState.error(error: error.apiErrorModel.message!));
    });
  }

}