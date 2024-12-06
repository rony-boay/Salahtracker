import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:salahtracker/screens/AllahNamesScreen.dart';
import 'package:salahtracker/screens/AzkarCategoryScreen.dart';
import 'package:salahtracker/screens/PrayerTiming.dart';
import 'package:salahtracker/screens/QiblaScreen.dart';
import 'package:salahtracker/screens/QuranScreen.dart';
import 'package:salahtracker/screens/SettingsScreen.dart';
import 'package:salahtracker/screens/SixKalmaScreen.dart';
import 'package:salahtracker/screens/TasbeehCounterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.teal,
      ),
      home: SalahTrackerScreen(
          toggleTheme: toggleTheme, isDarkTheme: isDarkTheme),
    );
  }
}

class SalahTrackerScreen extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkTheme;

  const SalahTrackerScreen(
      {required this.toggleTheme, required this.isDarkTheme});

  @override
  _SalahTrackerScreenState createState() => _SalahTrackerScreenState();
}

class _SalahTrackerScreenState extends State<SalahTrackerScreen> {
  final String currentDate = DateFormat('EEEE, dd MMMM').format(DateTime.now());
  String location = "Loading location...";

  final List<Map<String, dynamic>> cardsData = [
    {'name': 'Prayer Timing', 'icon': Icons.timelapse},
    {'name': 'Learn Quran', 'icon': Icons.book},
    {'name': '6 Kalma', 'icon': Icons.brightness_6},
    {'name': 'Azkar', 'icon': Icons.nightlight_round},
    {'name': 'Allah 99 Names', 'icon': Icons.star},
    {'name': 'Tasbeeh Counter', 'icon': Icons.speed},
    {'name': 'Qibla Finder', 'icon': Icons.compare_arrows_sharp},
    {'name': 'Settings', 'icon': Icons.settings},
  ];

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        location = "Location services are disabled.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          location = "Location permission denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        location = "Location permissions are permanently denied.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      setState(() {
        location = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        location = "Could not fetch location.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double availableHeight = constraints.maxHeight;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: availableHeight * 0.2,
                    ),
                    Text(
                      'Salah Tracker',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentDate,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.teal[50],
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
              child: InkWell(
                onTap: () {
                  if (cardsData[index]['name'] == 'Settings') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                          toggleTheme: widget.toggleTheme,
                          isDarkTheme: widget.isDarkTheme,
                        ),
                      ),
                    );
                  } else if (cardsData[index]['name'] == 'Learn Quran') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuranScreen(
                          location: location,
                        ),
                      ),
                    );
                  } else if (cardsData[index]['name'] == 'Prayer Timing') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PrayerTimingScreen(location: location),
                      ),
                    );
                  } else if (cardsData[index]['name'] == '6 Kalma') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SixKalmaScreen(),
                      ),
                    );
                  } else if (cardsData[index]['name'] == 'Azkar') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AzkarCategoryScreen(),
                      ),
                    );
                  } else if (cardsData[index]['name'] == 'Allah 99 Names') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllahNamesScreen(),
                      ),
                    );
                  } else if (cardsData[index]['name'] == 'Tasbeeh Counter') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TasbeehCounterScreen(),
                      ),
                    );
                  } else if (cardsData[index]['name'] == 'Qibla Finder') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QiblaScreen(),
                      ),
                    );
                  }
                },
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
              ),
            );
          },
        ),
      ),
    );
  }
}
