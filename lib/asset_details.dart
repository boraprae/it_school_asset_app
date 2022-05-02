import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asset/asset_scanner/components/qr_views.dart';

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
  bool _isButtonEnabled = true;
  int? val1 = 0;

  String numberInventory = "644562646";
  String nameInventory = "mate";

  void getData() async {
    String url = 'http://159.223.83.224:3002/scan';
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
      tcBuild.text = res[0]['Location'];
      tcRoom.text = res[0]['Room'];
      val1 = res[0]['Status'];
      if (res[0]['Date_scan'] != null) {
        _isButtonEnabled = false;
      }
      print(res[0]['Date_scan']);
    });
  }

  // void _disButton() {
  //   if()
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //! _isButtonEnabled = true;
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
                  onPressed: () {
                    Get.to(QR_Views());
                  },
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
                enabled: _isButtonEnabled,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Building',
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: tcRoom,
                enabled: _isButtonEnabled,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Room',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: val1,
                    onChanged: !_isButtonEnabled
                        ? null
                        : (value) {
                            setState(() {
                              val1 = 0;
                            });
                          },
                  ),
                  const Text("Lost"),
                  Radio(
                    value: 1,
                    groupValue: val1,
                    onChanged: !_isButtonEnabled
                        ? null
                        : (value) {
                            setState(() {
                              val1 = 1;
                            });
                          },
                  ),
                  const Text("Normal"),
                  Radio(
                    value: 2,
                    groupValue: val1,
                    onChanged: !_isButtonEnabled
                        ? null
                        : (value) {
                            setState(() {
                              val1 = 2;
                            });
                          },
                  ),
                  const Text("Degraded"),
                ],
              ),
              !_isButtonEnabled
                  ? Text('This asset is Checked')
                  : ElevatedButton(
                      onPressed: () async {
                        var building = tcBuild.text;
                        var room = tcRoom.text;
                        var valstatus = val1;
                        var inventory_number = numberInventory;

                        print(building);
                        print(room);

                        Response data = await GetConnect()
                            .post('http://159.223.83.224:3002/check', {
                          'inventory_number': inventory_number,
                          'location': building,
                          'room': room,
                          'status': valstatus
                        });

                        if (!data.isOk) {
                          return Get.defaultDialog(
                              title: 'Error', middleText: data.body);
                        }
                        _showMyDialog();
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
