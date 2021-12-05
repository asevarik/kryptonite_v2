// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:kryptonite/components/collapse_app_bar.dart';
import 'package:kryptonite/components/header_bar.dart';
import 'package:kryptonite/components/text_input.dart';

class GeneratePasswordScreen extends StatefulWidget {
  GeneratePasswordScreen({
    Key? key,
    required List<Map<String, dynamic>> passwordList,
  }) : super(key: key);

  @override
  State<GeneratePasswordScreen> createState() => _GeneratePasswordScreenState();
}

class _GeneratePasswordScreenState extends State<GeneratePasswordScreen> {
  final _generatePasswordFormKey = GlobalKey<FormState>();
  late FocusNode userNameFocus;
  late FocusNode passwordFocus;

  @override
  void initState() {
    userNameFocus = FocusNode();
    passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    userNameFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: collapseAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: ListView(
            children: [
              HeaderBar(
                onButtonPress: () => log("message"),
                title: "Generate New",
                needBackButton: true,
                icon: FlutterRemix.eraser_line,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text("Please enter the following details below."),
                    ),
                    Form(
                      key: _generatePasswordFormKey,
                      child: Column(
                        children: [
                          TextInput(
                            hintFragment: "Account/Website Nickname",
                            inputLabel: "Account/Website Nickname",
                            icon: FlutterRemix.global_line,
                            focus: true,
                            nextFocus: userNameFocus,
                          ),
                          TextInput(
                            hintFragment: "Enter Username",
                            inputLabel: "Username",
                            icon: FlutterRemix.account_circle_line,
                            focusNode: userNameFocus,
                            nextFocus: passwordFocus,
                          ),
                          TextInput(
                            hintFragment: "Enter Password",
                            inputLabel: "Generate Password",
                            icon: FlutterRemix.key_2_line,
                            hideText: false,
                            focusNode: passwordFocus,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log(_generatePasswordFormKey.currentState.toString());
          if (_generatePasswordFormKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password Entry Added!")),
            );
          }
        },
        child: Icon(FlutterRemix.save_2_line),
      ),
    );
  }
}
