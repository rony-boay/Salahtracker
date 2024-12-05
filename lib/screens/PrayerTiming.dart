import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerTimingScreen extends StatelessWidget {
  final String location;

  PrayerTimingScreen({required this.location});

  @override
  Widget build(BuildContext context) {
    // Sample prayer times
    final Map<String, String> prayerTimes = {
      'Fajr': '05:00 AM',
      'Sunrise': '06:15 AM',
      'Dhuhr': '12:30 PM',
      'Asr': '03:45 PM',
      'Sunset': '06:00 PM',
      'Maghrib': '06:15 PM',
      'Isha': '07:30 PM',
    };

    // Get the current date (Gregorian)
    final String gregorianDate =
        DateFormat('dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Location and mosque image with city name and Gregorian date overlay
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height *
                0.3, // 30% height of screen
            child: Stack(
              children: [
                // Mosque image
                Positioned.fill(
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/02/63/48/39/360_F_263483946_oUd7VNlXB7fbDhhmVkur6ytxBgsBTaH7.jpg',
                    fit: BoxFit
                        .fill, // Stretch the image to fit the width of the screen
                  ),
                ),
                // Overlay text (city name and Gregorian date)
                Positioned(
                  top: 20, // Position at the top of the image
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 14, 14, 14),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '$gregorianDate',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(179, 8, 8, 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Prayer times cards in horizontal ListView
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: prayerTimes.length,
                itemBuilder: (context, index) {
                  String prayerName = prayerTimes.keys.elementAt(index);
                  String prayerTime = prayerTimes[prayerName] ?? '';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Prayer name on the left
                            Text(
                              prayerName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Prayer time on the right
                            Text(
                              prayerTime,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
