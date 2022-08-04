import 'package:flutter/material.dart';

class LymphoWearState extends StatelessWidget {
  const LymphoWearState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Manual Mode',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.grey,
                foregroundColor: Colors.grey,
                child: Icon(Icons.image),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  surfaceTintColor: Colors.white),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
