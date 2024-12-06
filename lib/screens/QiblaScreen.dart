import 'package:flutter/material.dart';

class QiblaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Qibla Finder'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          height: 500, // Set the height you desire
          width: 400, // Set the width you desire
          child: Image.network(
            'https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/3e/1b/01/3e1b019c-c7dd-9b6a-21aa-cbdee38a78a1/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x600wa.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
