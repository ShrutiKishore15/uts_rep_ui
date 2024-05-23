import 'package:flutter/material.dart';
import 'package:uts_rep_ui/src/app/config/app_routes.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            OutlinedButton(
                onPressed: () {
                  GoRouter.of(context).push("/${AppRoutes.daily}");
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.indigo.shade900,
                  side: const BorderSide(width: 1.0, color: Colors.indigo),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Daily Reports',
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
