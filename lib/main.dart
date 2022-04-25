import 'package:flutter/material.dart';
import 'package:project_asset/asset_scan.dart';

void main() {
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/assetScan',
      routes: {
        '/assetScan': (context) => AssetScan(),
      },
    ),
  );
}