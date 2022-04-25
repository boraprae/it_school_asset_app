import 'package:flutter/material.dart';

class Asset_Details extends StatefulWidget {
  const Asset_Details({Key? key}) : super(key: key);

  @override
  State<Asset_Details> createState() => _Asset_DetailsState();
}

class _Asset_DetailsState extends State<Asset_Details> {


  bool _value = false;
  int val1 = 0;

  String numberInventory = "644562646";
  String nameInventory = "mate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asset_Details Details"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Inventory number"),
            Text(numberInventory),
            Text(nameInventory),
            const SizedBox(height: 30.0),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Building',
              ),
            ),
            const SizedBox(height: 30.0),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Room',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: val1,
                  onChanged: (value) {
                    setState(() {
                      val1 = 1;
                    });
                  },
                ),
                Text("Lost"),

                Radio(
                  value: 2,
                  groupValue: val1,
                  onChanged: (value) {
                    setState(() {
                      val1 = 2;
                    });
                  },
                ),
                Text("Normal"),
                
                Radio(
                  value: 3,
                  groupValue: val1,
                  onChanged: (value) {
                    setState(() {
                      val1 = 3;
                    });
                  },
                ),
                Text("Degraded"),

              ],
            ),
            ElevatedButton(
              onPressed: (){},
              child: const Text('Check'),
            ),
          ],
        ),
      )),
    );
  }
}
