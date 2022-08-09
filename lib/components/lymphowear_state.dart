import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/components/circularindicator.dart';

class LymphoWearState extends StatelessWidget {
  const LymphoWearState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Manual Mode',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    surfaceTintColor: Colors.white),
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: CircularIndicator(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Color(0xffE0E0E0)),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    surfaceTintColor: Colors.white),
                child: const Icon(
                  Icons.add,
                  color: Color(0xffE0E0E0),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
