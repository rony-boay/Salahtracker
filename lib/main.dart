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
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(140.0), // Dynamically adjust the AppBar height
        child: AppBar(
          backgroundColor: Colors.teal,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Get the available height dynamically
              double availableHeight = constraints.maxHeight;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Adjust position based on the height
                    SizedBox(
                        height: availableHeight *
                            0.2), // Dynamically adjust padding
                    Text(
                      'Salah Tracker',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8), // Fixed space between texts
                    Text(
                      'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  currentDate,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.teal[50], // Background color for the drawer
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
              // Additional menu items can be added here
            ],
          ),
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
