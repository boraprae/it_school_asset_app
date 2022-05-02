import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asset/asset_scanner/components/asset_status.dart';

class AssetScan extends StatelessWidget {
  const AssetScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          "IT ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF3FC0DF),
                          ),
                        ),
                        const Text(
                          "SCHOOL ASSET",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.logout),
                        ),
                      ],
                    ),
                  ),
                  //*Banner
                  Container(
                    width: queryData.size.width,
                    height: queryData.size.height / 5.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF2A9DF4),
                            Color(0xFF7CC0F1),
                          ]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'การตรวจนับครุภัณฑ์ประจำปี 2565',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'ครั้งที่ 1 ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'วันเริ่มต้น',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' 18/10/2022',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                'วันสิ้นสุด',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' 19/10/2022',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //*ความคืบหน้าการตรวจนับ*
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ความคืบหน้าการตรวจนับ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: queryData.size.width,
                              height: queryData.size.height / 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFFF0F0F0),
                              ),
                            ),
                            Positioned(
                              top: queryData.size.height * 0.01,
                              left: queryData.size.width * 0.05,
                              child: Text(
                                '78%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: queryData.size.height * 0.01,
                              left: queryData.size.width * 0.15,
                              child: Container(
                                width: queryData.size.width / 1.8,
                                height: queryData.size.height / 55,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFA64B6),
                                        Color(0xFFCFBDF5),
                                        Color(0xFF7CC0F1),
                                        Color(0xFF01E4A7),
                                      ]),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  assetBadge(
                      queryData,
                      'ครุภัณฑ์ทั้งหมด',
                      '1670',
                      Icons.assessment_outlined,
                      0xFFD0EFFF,
                      0xFF2A9DF4,
                      'ครุภัณฑ์ปกติ',
                      '1000',
                      Icons.checklist_rtl_outlined,
                      0xFFA6FFD1,
                      0xFF23BC8E),
                  const SizedBox(
                    height: 10,
                  ),
                  assetBadge(
                      queryData,
                      'ครุภัณฑ์เสื่อมสภาพ',
                      '600',
                      Icons.warning_amber_outlined,
                      0xFFFEEFB0,
                      0xFFF2C112,
                      'ครุภัณฑ์สูญหาย',
                      '5',
                      Icons.dangerous_outlined,
                      0xFFFFAF94,
                      0xFFDA3131),

                  Spacer(),
                  //**ปุ่มสแกน**/
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/qrViews');
                      },
                      color: Color(0xFF7CC0F1),
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.qr_code,
                        size: 46,
                      ),
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'สแกนเพื่อตรวจนับวัสดุ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
