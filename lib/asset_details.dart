import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asset/components/qr_views.dart';

class Asset_Details extends StatefulWidget {
  final String text;
  Asset_Details({Key? key, required this.text}) : super(key: key);

  @override
  State<Asset_Details> createState() => _Asset_DetailsState();
}

class _Asset_DetailsState extends State<Asset_Details> {
  final TextEditingController tcBuild = TextEditingController();
  final TextEditingController tcRoom = TextEditingController();

  bool _value = false;
  int val1 = 0;

  String numberInventory = "644562646";
  String nameInventory = "mate";

  void getData() async {
    String url = 'http://10.0.2.2:3002/scan';
    Response response =
        await GetConnect().get(url, query: {"inventory_number": widget.text});

    print(response.body);
    if (!response.isOk) {
      return Get.defaultDialog(title: 'Error', middleText: response.body);
    }

    List res = response.body;
    if (res.length == 0) {
      return Get.defaultDialog(title: 'Error', middleText: 'No data');
    }

    print(res);

    setState(() {
      numberInventory = res[0]['Inventory_Number'];
      nameInventory = res[0]['Asset_Description'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Column(
          children: [
            AlertDialog(
              title: const Text('Success'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[Text('Asset Checked!')],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    print("this is result: " + widget.text);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asset Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.to(QR_Views()),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("Inventory number"),
              Text(widget.text),
              Text(nameInventory),
              const SizedBox(height: 30.0),
              TextField(
                controller: tcBuild,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Building',
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: tcRoom,
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
                onPressed: () {
                  _showMyDialog();
                  //Get.to(());
                },
                child: const Text('Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
