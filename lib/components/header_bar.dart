// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class HeaderBar extends StatelessWidget {
  bool needBackButton;
  String title;
  IconData icon;
  void Function() onButtonPress;
  HeaderBar({
    this.needBackButton = false,
    this.title = "Kryptonite",
    this.icon = FlutterRemix.settings_line,
    Key? key,
    required this.onButtonPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (needBackButton)
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(FlutterRemix.arrow_left_line),
          ),
        SizedBox(
          width: 180,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        IconButton(
          icon: Icon(
            icon,
            size: 24,
          ),
          onPressed: onButtonPress,
        )
      ],
    );
  }
}
