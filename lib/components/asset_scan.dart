import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetScan extends StatelessWidget {
  const AssetScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
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
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: queryData.size.width,
                      height: 150,
                      child: Image.asset(
                        'assets/images/wallpaper.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/it_logo.png'),
                    ),
                  ),
                  
                  Text(
                    "IT School Asset".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/qrViews');
                    },
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
