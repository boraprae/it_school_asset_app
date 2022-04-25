import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class AssetScan extends StatefulWidget {
  const AssetScan({Key? key}) : super(key: key);

  @override
  State<AssetScan> createState() => _AssetScanState();
}

class _AssetScanState extends State<AssetScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/it_logo.png'),
                    ),
                  ),
                  Text(
                    "IT School Asset",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.qr_code,
                      size: 36,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                  Text(
                    'Scan here',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void qrScanner(){

}
