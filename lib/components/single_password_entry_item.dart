// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:kryptonite/screens/share_password.dart';

class SinglePasswordEntryItem extends StatelessWidget {
  Color checkColor(String status) {
    if (status == 'healthy') {
      return Colors.indigo.shade300;
    } else if (status == 'reused') {
      return Colors.pink.shade300;
    } else {
      return Colors.deepPurple.shade300;
    }
  }

  late Map<String, dynamic> passwordList;

  SinglePasswordEntryItem({
    Key? key,
    required this.passwordList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: checkColor(
                passwordList['passwordStatus'],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(right: 15),
          ),
          SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  passwordList['websiteNickname'],
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  passwordList['entryUsername'],
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (content) => SharePassword(
                  password: passwordList,
                ),
              ),
            ),
            // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => )),
            icon: Icon(
              FlutterRemix.arrow_right_up_line,
            ),
          )
        ],
      ),
    );
  }
}
