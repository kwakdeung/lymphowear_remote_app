import 'package:flutter/material.dart';

var bottombuttonmargin =
    const EdgeInsets.only(top: 80, bottom: 80, left: 20, right: 20);

var bottombuttonpadding = const EdgeInsets.fromLTRB(12, 24, 12, 24);

bool isMobileWidth(BuildContext context) =>
    MediaQuery.of(context).size.width >= 360;
bool isMobileHeight(BuildContext context) =>
    MediaQuery.of(context).size.height >= 640;
