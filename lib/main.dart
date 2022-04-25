import 'package:flutter/material.dart';
import 'package:project_asset/asset_scan.dart';
import 'package:project_asset/qr_sample.dart';

void main() {
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/test',
      routes: {
        '/assetScan': (context) => AssetScan(),
        '/test' : (context) => MyHome(),
      },
    ),
  );
}