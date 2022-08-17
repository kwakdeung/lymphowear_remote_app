import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Heat extends StatefulWidget {
  const Heat({Key? key}) : super(key: key);

  @override
  State<Heat> createState() => _HeatState();
}

class _HeatState extends State<Heat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(7)),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(0.0),
      height: 60,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: SvgPicture.asset(
              'assets/images/Heat.svg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0.0),
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Heat',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'intensity 1',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Poppins",
                      ),
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
