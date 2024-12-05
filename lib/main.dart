import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:salahtracker/screens/PrayerTiming.dart';

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

class SalahTrackerScreen extends StatefulWidget {
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
        preferredSize: Size.fromHeight(140.0),
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
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                      style: TextStyle(
                        fontSize: 14,
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
                  if (cardsData[index]['name'] == 'Prayer Timing') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayerTimingScreen(location: location),
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
