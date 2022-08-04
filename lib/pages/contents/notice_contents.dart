import 'package:flutter/material.dart';

class NoticeContents extends StatefulWidget {
  const NoticeContents(
      {Key? key,
      required this.image,
      required this.instruction,
      required this.detail})
      : super(key: key);
  final String image, instruction, detail;

  @override
  State<NoticeContents> createState() => _NoticeContentsState();
}

class _NoticeContentsState extends State<NoticeContents> {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      width: double.infinity,
      height: pageSize.height,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              widget.image,
              height: pageSize.height * 0.1,
            ),
          ),
          SizedBox(height: pageSize.height * 0.05),
          Container(
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(0.0),
            child: Text(
              widget.instruction,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: pageSize.height * 0.03),
          Container(
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: pageSize.width * 0.6,
              height: double.infinity,
              child: Text(
                widget.detail,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
