import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/components/loader.dart';

class AddDeviceContents extends StatefulWidget {
  const AddDeviceContents(
      {Key? key,
      required this.name,
      required this.model,
      required this.loading})
      : super(key: key);

  final String name, model, loading;

  @override
  State<AddDeviceContents> createState() => _AddDeviceContentsState();
}

class _AddDeviceContentsState extends State<AddDeviceContents> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(0.0),
          padding: const EdgeInsets.all(0.0),
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: const Loader(),
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Text('Device'),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: pageSize.width * 0.38,
                    ),
                    Container(
                      margin: const EdgeInsets.all(0.0),
                      padding: const EdgeInsets.all(0.0),
                      child: AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
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
}
