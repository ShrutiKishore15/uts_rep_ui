part of 'daily_report_bloc.dart';

@immutable
sealed class DailyReportEvent {}

class DailyReportInitialiseEvent extends DailyReportEvent {
  DailyReportInitialiseEvent();
  
  @override
  List<Object> get props => [];
}