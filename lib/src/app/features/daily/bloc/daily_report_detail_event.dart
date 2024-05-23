part of 'daily_report_detail_bloc.dart';

@immutable
sealed class DailyReportDetailEvent {}


class DailyReportDetailInitialiseEvent extends DailyReportDetailEvent {
  DailyReportRequest request;
  
  DailyReportDetailInitialiseEvent(
    this.request,
  );
  
  @override
  List<Object> get props => [request];
}


class DailyReportDetailLoadedEvent extends DailyReportDetailEvent {
  
  DailyReportDetailLoadedEvent();
  
  @override
  List<Object> get props => [];
}

class DailyReportDetailSectionChangeEvent extends DailyReportDetailEvent {
  
  DailyReportDetailSectionChangeEvent();
  
  @override
  List<Object> get props => [];
}