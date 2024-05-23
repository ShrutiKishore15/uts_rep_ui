import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_rep_ui/src/app/features/daily/bloc/daily_report_bloc.dart';

class DailyReportMenuPage extends StatefulWidget {
  const DailyReportMenuPage({super.key});

  @override
  State<DailyReportMenuPage> createState() => _DailyReportMenuPageState();
}

class _DailyReportMenuPageState extends State<DailyReportMenuPage> {
  late DailyReportBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<DailyReportBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Daily Report")),
      body: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 1.0,
        childAspectRatio: 2.2,
        children: List.generate(bloc.reportsList.length, (index) {
          return Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.album),
                            title: Text(
                              bloc.reportsList[index].reportName,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Text('Daily'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('View'),
                                onPressed: () {
                                  bloc.sendReportRequest(context,bloc.reportsList[index].reportId);
                                },
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('Print'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('Download PDF'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ]),
                  )));
        }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}