import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/common/users_data/Cubit/get_users_state.dart';
import 'package:naffith/common/users_data/Data/models/users_response_body.dart';
import 'package:naffith/common/users_data/Data/repo/get_users_repo.dart';

class GetUsersCubit extends Cubit<GetUsersStates> {

  final GetUsersRepo _getUsersRepo;
  List<String> usersNames = [];
  List<UsersResponseBody> usersData = [];
  int userId = 0;

  GetUsersCubit(this._getUsersRepo) : super(const GetUsersStates.initial());

  void emitGetUsersStates() async {
    final response = await _getUsersRepo.getUserList();
    response.when(success: (List<UsersResponseBody> usersResponseBody) {
      usersNames = usersResponseBody
          .map((user) => user.name)
          .where((name) => name != null)
          .map((name) => name!)
          .toList();
      usersData = usersResponseBody;
      emit(GetUsersStates.success(usersResponseBody));
    }, failure: (error) {
      emit(GetUsersStates.error(error: error.apiErrorModel.message!));
    });
  }

  void getUserID({required String name}) {
    int index = usersNames.indexOf(name);
    print(name);
    // Filter out null values and then convert to a list of non-nullable integers
    final List<int> ids = usersData.map((item) => item.id).whereType<int>().toList();

    if (index != -1 && index < ids.length) {
      int correspondingId = ids[index];
      userId = correspondingId;
      print('The id for name is $correspondingId');
      print(userId);
    } else {
      print('not found in the list');
    }
  }

}