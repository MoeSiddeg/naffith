class StageState {
  int page;

  StageState({this.page = 0});
  StageState copyWith({
    int? page,
  }) => StageState(
    page: page ?? this.page,
  );
}
