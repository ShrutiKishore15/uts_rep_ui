import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:string_validator/string_validator.dart';

import 'package:uts_rep_ui/src/app/features/daily/bloc/daily_report_detail_bloc.dart';
import 'package:uts_rep_ui/src/app/features/daily/models/acds_m9psgn.dart';
import 'package:uts_rep_ui/src/app/features/daily/models/report_section_name_model.dart';
import 'package:uts_rep_ui/src/app/model/daily_report_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyReportDetailPage extends StatefulWidget {
  const DailyReportDetailPage({
    super.key,
  });

  @override
  State<DailyReportDetailPage> createState() => _DailyReportDetailPageState();
}

class _DailyReportDetailPageState extends State<DailyReportDetailPage> {
  late DailyReportDetailBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<DailyReportDetailBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Daily Report"),
      ),
      body: BlocConsumer<DailyReportDetailBloc, DailyReportDetailState>(
        listener: (context, state) {
          // TODO: implement listener
          debugPrint("*****LISTENER*****");
          debugPrint(state.toString());
        },
        builder: (context, state) {
          if (state is DailyReportDetailLoading ||
              state is DailyReportDetailFetching) {
            return const Center(
                child: Column(
              children: [
                Text('Please wait report is loading...'),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator()
              ],
            ));
          } else {
            if (state is DailyReportDetailLoaded ||
                state is DailyReportDetailSectionLoaded) {
              debugPrint("*** Sections ***");
              debugPrint(state.toString());
              List<ReportSectionName> sections = List.empty(growable: true);
              for (int i = 0; i < bloc.report.reportData.length; i++) {
                ReportSectionName t = ReportSectionName(
                    sectionName: bloc.report.reportData[i].section,
                    order: bloc.report.reportData[i].order.toString());
                sections.add(t);
              }

              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 600,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bloc.report.system,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bloc.report.reportName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  bloc.report.reportType,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Zone"),
                                Text("Report Date"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(bloc.report.zone,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(bloc.report.date,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Location"),
                                Text("Date of Run"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(bloc.report.locationCode,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(bloc.report.dateOfRun,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SegmentedButton<String>(
                        emptySelectionAllowed: true,
                        multiSelectionEnabled: false,
                        segments: <ButtonSegment<String>>[
                          for (int i = 0; i < sections.length; i++)
                            ButtonSegment<String>(
                                value: sections[i].sectionName,
                                label: Text(
                                  sections[i].sectionName,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                                )),
                        ],
                        selected: {bloc.currentReportSectionName},
                        onSelectionChanged: (Set<String> newSelection) {
                          bloc.currentReportSectionName = newSelection.first;
                          bloc.add(DailyReportDetailSectionChangeEvent());
                        },
                      ),
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //       padding: const EdgeInsets.all(8),
                  //       height: 500,
                  //       width: double.maxFinite,
                  //       child: (state is DailyReportDetailSectionLoaded)
                  //           ? SingleChildScrollView(
                  //             scrollDirection: Axis.vertical,
                  //             child: _buildDataTable(context)
                  //           )
                  //           : (state is DailyReportDetailSectionLoading) ? const CircularProgressIndicator(): const Text("Please select a report section")),
                  // )
                  Center(
                      child: (state is DailyReportDetailSectionLoaded)
                          ? _buildNewTable(context)
                          : (state is DailyReportDetailSectionLoading)
                              ? const CircularProgressIndicator()
                              : const Text("Please select a report section",style: TextStyle(fontSize: 16,color: Colors.red),))
                ],
              );
            } else {
              return const Center(
                child: Text("Error Occured while Processing"),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildNewTable(BuildContext context) {
    final bloc = BlocProvider.of<DailyReportDetailBloc>(context);
    late ReportDatum currentSection;

    if (bloc.currentReportSection != null) {
      currentSection = bloc.currentReportSection!;
    }

    List figures = currentSection.figures;
    List<ColumnInfo> columns = currentSection.columnInfo;

    // Set<DataColumn> dataColumns = {};
    // List<DataRow> dataRows = List.empty(growable: true);

    // for (int i = 0; i < currentSection.columnInfo.length; i++) {
    //   dataColumns.add(DataColumn(
    //       label: Text(currentSection.columnInfo[i].columnName,
    //           style: const TextStyle(fontWeight: FontWeight.bold))));
    // }

    // for (int i = 0; i < figures.length; i++) {
    //   Map<String, dynamic> figure = figures[i].toMap();
    //   List<DataCell> cells = List.empty(growable: true);
    //   for (int j = 0; j < columns.length; j++) {
    //     String k = figure.keys
    //         .firstWhere((element) => element == columns[j].columnName);
    //     figure.forEach((key, value) {
    //       if (key == k) cells.add(DataCell(Text("$value")));
    //     });
    //   }
    //   dataRows.add(DataRow(cells: cells));
    // }

    return SizedBox(
      // width: double.maxFinite,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0,10,30,0),
        child: ScrollableTableView(
          headers: columns.map((column) {
            return TableViewHeader(
              alignment: Alignment.centerLeft,
              label: column.columnName,
            );
          }).toList(),
          rows: figures.map((row) {
            debugPrint("% - ${row.toString()}");
            return TableViewRow(
              height: 30,
              cells: columns.map((column) {
                debugPrint("# - ${column.toString()}");
                dynamic cellContent = row.toMap().entries.firstWhere((element) => element.key == column.columnName).value.toString();
                bool isCellContentNumeric = isNumeric(cellContent);
                debugPrint(cellContent.toString());
                debugPrint(isCellContentNumeric.toString());
                return TableViewCell(

                  alignment: isCellContentNumeric ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(cellContent,style: const TextStyle(fontSize: 14)),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDataTable(BuildContext context) {
    final bloc = BlocProvider.of<DailyReportDetailBloc>(context);
    late ReportDatum currentSection;

    if (bloc.currentReportSection != null) {
      currentSection = bloc.currentReportSection!;
    }

    List<dynamic> figures = currentSection.figures;
    List<ColumnInfo> columns = currentSection.columnInfo;

    Set<DataColumn> dataColumns = {};
    List<DataRow> dataRows = List.empty(growable: true);

    for (int i = 0; i < currentSection.columnInfo.length; i++) {
      // debugPrint("${currentSection.columnInfo[i].columnName}, isOptional :${currentSection.columnInfo[i].isOptional}");
      // if (!currentSection.columnInfo[i].isOptional) {
      dataColumns.add(DataColumn(
          label: Text(currentSection.columnInfo[i].columnName,
              style: const TextStyle(fontWeight: FontWeight.bold))));
      // }
    }

    for (int i = 0; i < figures.length; i++) {
      Map<String, dynamic> figure = figures[i].toMap();
      List<DataCell> cells = List.empty(growable: true);
      for (int j = 0; j < columns.length; j++) {
        String k = figure.keys
            .firstWhere((element) => element == columns[j].columnName);
        figure.forEach((key, value) {
          if (key == k) cells.add(DataCell(Text("$value")));
        });
      }
      dataRows.add(DataRow(cells: cells));
    }

    return SizedBox(
      width: double.infinity,
      child: DataTable(
        showCheckboxColumn: false,
        rows: dataRows,
        columns: dataColumns.toList(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
