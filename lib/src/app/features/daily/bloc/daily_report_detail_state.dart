part of 'daily_report_detail_bloc.dart';

@immutable
sealed class DailyReportDetailState {}

final class DailyReportDetailInitial extends DailyReportDetailState {}
final class DailyReportDetailFetching extends DailyReportDetailState {}
final class DailyReportDetailLoading extends DailyReportDetailState {}
final class DailyReportDetailLoaded extends DailyReportDetailState {}
final class DailyReportDetailFetchingFailed extends DailyReportDetailState {}
final class DailyReportDetailLoadingFailed extends DailyReportDetailState {}
final class DailyReportDetailError extends DailyReportDetailState {}
final class DailyReportDetailSuccess extends DailyReportDetailState {}
final class DailyReportDetailSectionLoading extends DailyReportDetailState {}
final class DailyReportDetailSectionLoaded extends DailyReportDetailState {}