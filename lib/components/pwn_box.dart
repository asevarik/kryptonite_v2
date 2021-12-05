// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class PwnedBox extends StatefulWidget {
  const PwnedBox({Key? key}) : super(key: key);

  @override
  State<PwnedBox> createState() => _PwnedBoxState();
}

class _PwnedBoxState extends State<PwnedBox> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: status == true
              ? Colors.pink.shade300
              : Colors.lightGreen.shade400,
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 10,
              color: status == true
                  ? Colors.pink.shade200
                  : Colors.lightGreen.shade200,
            ),
          ]),
      duration: Duration(milliseconds: 400),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Account Status : ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                status == true ? "Oh No, Pwned!" : "You're Safe",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              IconButton(
                  icon: Icon(
                    FlutterRemix.refresh_line,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      status = !status;
                    });
                  })
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            status == true
                ? "Your information was leaked to the public!"
                    "We suggest you to change your passwords"
                : "Your information is safe and \nhas not yet leaked!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
