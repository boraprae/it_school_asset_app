import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asset/asset_scanner/asset_scan.dart';
import 'package:project_asset/asset_scanner/components/qr_views.dart';

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
