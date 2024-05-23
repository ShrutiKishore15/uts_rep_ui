import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uts_rep_ui/src/app/config/app_routes.dart';
import 'package:uts_rep_ui/src/app/features/authentication/login_page.dart';
import 'package:uts_rep_ui/src/app/features/daily/bloc/daily_report_bloc.dart';
import 'package:uts_rep_ui/src/app/features/daily/bloc/daily_report_detail_bloc.dart';
import 'package:uts_rep_ui/src/app/features/daily/daily_report_detail_page.dart';
import 'package:uts_rep_ui/src/app/features/daily/daily_report_menu_page.dart';
import 'package:uts_rep_ui/src/app/features/dashboard/dashboard_page.dart';
import 'package:uts_rep_ui/src/app/model/daily_report_request.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    initialLocation: '/dashboard',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, GoRouterState state, child) {
          return Scaffold(
            body: Row(children: <Widget>[Expanded(child: child)]),
            appBar: AppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'UTS Reports (Eastern Railway)',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Howrah(HWH)',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF3F3122),
                    ),
                    child: Text(
                      'Hello Kapildev Gangopadhyay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text('Messages'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Profile'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Default Settings'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.data_exploration),
                    title: const Text('Report Type'),
                    onTap: () {
                      // Handle tap
                      Navigator.pop(context);
                      // _showDropdownDialog(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text('Report Date'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      // _showDatePicker(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            name: AppRoutes.dashboard,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                  child: Scaffold(
                body: DashboardPage(),
              ));
            },
          ),
          GoRoute(
            path: '/daily',
            name: AppRoutes.daily,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) => Center(
              child: BlocProvider(
                create: (context) => DailyReportBloc()..add(DailyReportInitialiseEvent()),
                child: const  DailyReportMenuPage(),
              ),
            ),

            // pageBuilder: (context, state) {
            //   return const NoTransitionPage(
            //     child: DailyReportMenuPage(),
            //   );
            // },
          ),
          GoRoute(
            path: '/daily/detail',
            name: AppRoutes.dailyReportDetail,
            parentNavigatorKey: _shellNavigatorKey,
            builder:(context, state) {
              debugPrint("Redirect to Daily Detail Report");
              DailyReportRequest request = state.extra as DailyReportRequest;
                  return BlocProvider(
                    create: (context) => DailyReportDetailBloc()..add(DailyReportDetailInitialiseEvent(request)),
                    child: const DailyReportDetailPage(),
              );
            },
            redirect: (context, state) {
              if (state.extra == null) {
                return "/daily";
              } else {
                return null;
              }
            },
          ),
        ],
      ),
      GoRoute(
          name: AppRoutes.login,
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          }),
    ],
  );

  static GoRouter get router => _router;
}
