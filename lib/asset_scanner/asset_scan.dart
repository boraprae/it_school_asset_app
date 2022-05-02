import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asset/asset_scanner/components/asset_status.dart';

class AssetScan extends StatelessWidget {
  const AssetScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    TextEditingController tcAssetNumber = TextEditingController();

    String startDate = '18/10/2565';
    String endDate = '19/10/2565';
    String totalAllAsset = '1670';
    String totalNormalAsset = '1670';
    String totalBorkeAsset = '599';
    String totalLostAsset = '6';

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
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.logout),
                        ),
                      ],
                    ),
                  ),
                  //*Banner
                  Container(
                    width: queryData.size.width,
                    height: queryData.size.height / 5.5,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFF2A9DF4),
                            Color(0xFF7CC0F1),
                          ]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'การตรวจนับครุภัณฑ์ประจำปี 2565',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'ครั้งที่ 1 ',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                'วันเริ่มต้น',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' ' + startDate,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const Text(
                                'วันสิ้นสุด',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' ' + endDate,
                                style: const TextStyle(
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
                        const Text(
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
                                color: const Color(0xFFF0F0F0),
                              ),
                            ),
                            Positioned(
                              top: queryData.size.height * 0.01,
                              left: queryData.size.width * 0.05,
                              child: const Text(
                                '78%',
                                style: const TextStyle(
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
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFA64B6),
                                        const Color(0xFFCFBDF5),
                                        Color(0xFF7CC0F1),
                                        const Color(0xFF01E4A7),
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
                      totalAllAsset,
                      Icons.assessment_outlined,
                      0xFFD0EFFF,
                      0xFF2A9DF4,
                      'ครุภัณฑ์ปกติ',
                      totalNormalAsset,
                      Icons.checklist_rtl_outlined,
                      0xFFA6FFD1,
                      0xFF23BC8E),
                  const SizedBox(
                    height: 10,
                  ),
                  assetBadge(
                      queryData,
                      'ครุภัณฑ์เสื่อมสภาพ',
                      totalBorkeAsset,
                      Icons.warning_amber_outlined,
                      0xFFFEEFB0,
                      0xFFF2C112,
                      'ครุภัณฑ์สูญหาย',
                      totalLostAsset,
                      Icons.dangerous_outlined,
                      0xFFFFAF94,
                      0xFFDA3131),

                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'เลือกวิธีการตรวจนับ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Center(
                    child: const Text(
                      'ป้อนรหัสวัสดุ 15 หลัก',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ป้อนรหัสวัสดุ 15 หลัก',
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: queryData.size.width * 0.12,
                                    width: queryData.size.width * 0.5,
                                    child: TextField(
                                      controller: tcAssetNumber,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        hintText: 'Inventory Number',
                                        hintStyle: const TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: const Color(0xFF7CC0F1),
                                              width: 1.5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: const Color(0xFF7CC0F1),
                                              width: 1.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },

                      color: const Color(0xFF7CC0F1),
                      textColor: Colors.white,
                      child: const Text(
                        'ป้อนรหัส',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      // padding: const EdgeInsets.all(16),
                      // shape: const CircleBorder(),
                    ),
                  ),
                  Spacer(),
                  const Center(
                    child: Text(
                      'หรือ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'สแกน QR Code ของวัสดุ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Spacer(),
                  //**ปุ่มสแกน**/
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/qrViews');
                      },
                      color: const Color(0xFF7CC0F1),
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.qr_code,
                        size: 46,
                      ),
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
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
