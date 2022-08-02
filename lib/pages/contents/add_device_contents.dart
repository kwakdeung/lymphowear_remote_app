import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
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
                    SizedBox(height: pageSize.height * 0.1),
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
                      width: pageSize.width * 0.2,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: pageSize.height * 0.05,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          )),
                          onPressed: () {},
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
