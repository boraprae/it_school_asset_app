import 'package:flutter/material.dart';

class AssetScan extends StatelessWidget {
  const AssetScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "IT Asset",
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              textColor: Colors.white,
              child: Icon(
                Icons.camera_alt,
                size: 24,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
