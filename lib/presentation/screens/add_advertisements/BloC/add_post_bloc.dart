import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_post_event.dart';
import 'add_post_state.dart';

class StageBloc extends Bloc<StageEvent, StageState>{
  StageBloc() : super(StageState(page: 0));

  @override
  Stream<StageState> mapEventToState(StageEvent event) async* {
    if (event is PageChangeStageEvent) {
      if (event.targetPage != null && event.targetPage! < 4) {
        yield state.copyWith(page: event.targetPage!);
      } else if (event.currentPage < 3) {
        yield state.copyWith(page: event.currentPage + 1);
      }
    }
  }
}