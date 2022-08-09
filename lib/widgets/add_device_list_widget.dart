import 'package:flutter/material.dart';

class AddDeviceListWidget extends StatefulWidget {
  const AddDeviceListWidget(
      {Key? key,
      required this.name,
      required this.model,
      required this.loading})
      : super(key: key);
  final String name, model, loading;
  @override
  AddDeviceListWidgetState createState() => AddDeviceListWidgetState();
}

class AddDeviceListWidgetState extends State<AddDeviceListWidget> {
  bool userGuide = false;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(0.0),
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: getsettingList(),
        ),
      ),
    );
  }

  List<Widget> getsettingList() {
    List<Widget> settingList = [
      ListTile(
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        title: Text(
          widget.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          widget.model,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
        onTap: () {},
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          )),
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
          child: const Text(
            'Sync',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
      _getDividerCategory(),
    ];
    return settingList;
  }

  Widget getDivider() {
    return Divider(
      color: Colors.grey[100],
      height: 3,
      thickness: 10,
    );
  }

  Widget _getDividerCategory() {
    return Divider(
      color: Colors.grey[300],
      height: 0,
      thickness: 1,
    );
  }
}
