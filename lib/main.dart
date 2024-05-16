import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reports',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReportsPage(),
    );
  }
}

class ReportsPage extends StatelessWidget {
  // Sample list of reports
  final List<String> reportsList = [
    'Cancelled Tickets',
    'Special Cancelled Tickets',
    'Non-Issue Tickets',
    'TTE Money Receipts',
    'TC Money Receipts',
    'Misc Receipt Tickets',
    'M9 Classification Tickets',
    'Sum of Trans(Cash Information)',
    'M17 Continuity and Ticket Information',
    'Journey and Season Station Pair',
    'All Vouchers',
    'Blank Papaer Tickets(BPT)',
    'Supervisor Intervention',
    'Bank Card Transaction',
    'UPI Transaction',
    'Surcharge',
    'All Concessions(Journey plus Season)',
    'PCDO/MCDO Daily(UTS,ATVM,Mobile)',
    'Suburban/Nonsuburban Bifurcation(UTS,ATVM,Mobile)',
    'Cab Road',
    'Tourist Ticket',
  ];

  String _selectedItem = 'Daily';
  List<String> _items = ['Daily', 'Periodic', 'Monthly'];

  // Number of columns to display
  final int numColumns = 5;

  ReportsPage({super.key});

  DateTime _selectedDate = DateTime.now();

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
    }
  }

  Future<void> _showDropdownDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Item'),
          content: DropdownButton<String>(
            value: _selectedItem,
            onChanged: (String? newValue) {
              _selectedItem = newValue!;
              Navigator.pop(context);
            },
            items: _items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'UTS Daily Reports (Eastern Railway)',
              textAlign: TextAlign.left,
            ),
            Text(
              'Location: Howrah(HWH)',
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
                _showDropdownDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text('Report Date'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _showDatePicker(context);
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
      body: GridView.count(
        crossAxisCount: numColumns,
        mainAxisSpacing: 1.0,
        childAspectRatio: 2.2,
        children: List.generate(reportsList.length, (index) {
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
                              reportsList[index],
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
                                onPressed: () {/* ... */},
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
}
