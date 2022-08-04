import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeatingOption extends StatefulWidget {
  const HeatingOption({Key? key}) : super(key: key);

  @override
  State<HeatingOption> createState() => _HeatingOptionState();
}

class _HeatingOptionState extends State<HeatingOption> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wb_sunny_outlined),
          const SizedBox(
            width: 15,
          ),
          const Text('Heating Option'),
          const SizedBox(
            width: 75,
          ),
          buildIOSSwitch(),
        ],
      ),
    );
  }

  Widget buildIOSSwitch() => Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );
}
