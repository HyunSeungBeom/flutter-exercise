import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings Screen'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _openAppSettings();
            },
            child: Text('개인정보 보호 및 보안'), 
          ),
        ),
      ),
    );
  }

  void _openAppSettings() async {
    if (Platform.isAndroid) {
      // Android 설정 화면으로 이동
      const platform = const MethodChannel('com.example.app/settings');
      try {
        await platform.invokeMethod('openAppSettings');
      } on PlatformException catch (e) {
        print("Failed to open settings: ${e.message}");
      }
    } else if (Platform.isIOS) {
      // iOS 설정 화면으로 이동
      const url = 'App-Prefs:root=Privacy&path=CAMERA';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      // 다른 플랫폼에서는 처리하지 않음
      print('Unsupported platform');
    }
  }
}
