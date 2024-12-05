import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SalahTrackerScreen(),
    );
  }
}

class SalahTrackerScreen extends StatelessWidget {
  final String currentDate = DateFormat('EEEE, dd MMMM').format(DateTime.now());

  final List<Map<String, dynamic>> cardsData = [
    {'name': 'Fajr', 'icon': Icons.wb_sunny},
    {'name': 'Dhuhr', 'icon': Icons.wb_cloudy},
    {'name': 'Asr', 'icon': Icons.wb_shade},
    {'name': 'Maghrib', 'icon': Icons.nightlight_round},
    {'name': 'Isha', 'icon': Icons.star},
    {'name': 'Tahajjud', 'icon': Icons.brightness_2},
    {'name': 'Qiyam', 'icon': Icons.access_alarm},
    {'name': 'Witr', 'icon': Icons.light_mode},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Drawer Menu
            // Builder(
            //   builder: (context) => IconButton(
            //     icon: Icon(Icons.menu),
            //     onPressed: () {
            //       Scaffold.of(context).openDrawer();
            //     },
            //   ),
            // ),
            // // Salah Tracker Text
            Text(
              'Salah Tracker',
              style: TextStyle(fontSize: 18),
            ),
            // Current Date
            Text(
              currentDate,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: cardsData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cardsData[index]['icon'],
                    size: 40,
                    color: Colors.teal,
                  ),
                  SizedBox(height: 8),
                  Text(
                    cardsData[index]['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
