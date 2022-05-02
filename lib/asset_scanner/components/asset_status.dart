import 'package:flutter/material.dart';

Widget assetBadge(queryData, assetName1, assetNum1, icon1, bgColor1, textColor1,
    assetName2, assetNum2, icon2, bgColor2, textColor2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: queryData.size.width / 2.6,
        height: queryData.size.height / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(bgColor1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                assetName1,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    icon1,
                    size: 34,
                  ),
                  Text(
                    assetNum1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(textColor1),
                    ),
                  ),
                  Text(
                    '  รายการ',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        width: queryData.size.width / 2.6,
        height: queryData.size.height / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(bgColor2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                assetName2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    icon2,
                    size: 34,
                  ),
                  Text(
                    assetNum2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(textColor2),
                    ),
                  ),
                  Text(
                    '  รายการ',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
