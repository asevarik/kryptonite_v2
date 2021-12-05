// ignore_for_file: must_be_immutable, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:kryptonite/components/collapse_app_bar.dart';
import 'package:kryptonite/components/header_bar.dart';
import 'package:kryptonite/components/qr_code_display.dart';
import 'package:kryptonite/components/text_input.dart';
import 'package:kryptonite/model/saved_password_entry.dart';
import 'package:kryptonite/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SharePassword extends StatelessWidget {
  SavedPasswordEntry password;

  SharePassword({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(FlutterRemix.check_line),
        onPressed: () => log("FAB Share Pressed"),
      ),
      appBar: collapseAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: ListView(
          children: [
            HeaderBar(
              needBackButton: true,
              title: password.websiteNickname,
              icon: FlutterRemix.pencil_line,
              onButtonPress: () => log("Changing the button"),
            ),
            QrCodeDisplay(
              data: "${password.entryUsername}: ${password.entryPassword}",
            ),
            TextInput(
              hintFragment: password.entryUsername,
              inputLabel: "Username",
              icon: FlutterRemix.account_circle_line,
            ),
            TextInput(
              hintFragment: password.entryPassword,
              inputLabel: "Password",
              icon: FlutterRemix.key_line,
              needGenerateIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}
