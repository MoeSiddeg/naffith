class StageEvent{}
class PageChangeStageEvent extends StageEvent {
  final int currentPage;
  final int? targetPage;
   PageChangeStageEvent({
    required this.currentPage,
    this.targetPage,
  });

  @override
  String toString() => 'PageChangeStageEvent: '
      'currentPage = $currentPage, targetPage = ${targetPage ?? 'null'}';
}
class NextStageEvent extends StageEvent {
  @override
  String toString() => 'NextStageEvent';
}