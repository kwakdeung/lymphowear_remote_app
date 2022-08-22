import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class MyNone extends StatelessWidget {
  const MyNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text('My Device',
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xffF3F3F3),
        child: Container(
          margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 56, 0, 15),
                child: SvgPicture.asset(
                  'assets/images/none_title.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: SvgPicture.asset(
                  'assets/images/none_content.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SvgPicture.asset(
                  'assets/images/none_image.svg',
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle_outline_outlined,
                    color: Color(0xff008A40),
                  ),
                  label: const Text(
                    'Add Device',
                    style: TextStyle(
                      color: Color(0xff008A40),
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    primary: Colors.white,
                    // fixedSize: const Size(320, 48),
                    side: const BorderSide(color: Color(0xff008A40)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
