import 'package:flutter/material.dart';

class Armpit extends StatefulWidget {
  const Armpit({Key? key}) : super(key: key);

  @override
  State<Armpit> createState() => _ArmpitState();
}

class _ArmpitState extends State<Armpit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(7)),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(0.0),
      height: 80,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5.0, right: 0.0),
            child: Image.asset(
              'assets/images/Armpit.png',
              width: 60,
              height: 60,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0),
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Armpit',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 71,
                    ),
                    Text(
                      'intensity 1',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                const Text('Slider 추가'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
