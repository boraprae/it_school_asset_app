import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asset/components/asset_scan.dart';
import 'package:project_asset/components/qr_views.dart';

void main() {
  runApp(
      GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/assetScan',
      routes: {
        '/assetScan': (context) => AssetScan(),
        '/qrViews': (context) => QR_Views(),
      },
    ),
  );
}