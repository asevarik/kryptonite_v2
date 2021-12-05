// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:kryptonite/components/collapse_app_bar.dart';
import 'package:kryptonite/components/header_bar.dart';
import 'package:kryptonite/components/text_input.dart';
import 'package:kryptonite/providers/provider.dart';
import 'package:provider/provider.dart';

class AddExistingPasswordScreen extends StatefulWidget {
  AddExistingPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddExistingPasswordScreen> createState() =>
      _AddExistingPasswordScreenState();
}

class _AddExistingPasswordScreenState extends State<AddExistingPasswordScreen> {
  final _addExistingPasswordFormKey = GlobalKey<FormState>();

  late FocusNode userNameFocus;
  late FocusNode passwordFocus;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final websiteNickNameController = TextEditingController();

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
    websiteNickNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
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
                title: "Add Existing",
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
                      key: _addExistingPasswordFormKey,
                      child: Column(
                        children: [
                          TextInput(
                            hintFragment: "Account/Website Nickname",
                            inputLabel: "Account/Website Nickname",
                            icon: FlutterRemix.global_line,
                            controller: websiteNickNameController,
                            focus: true,
                            nextFocus: userNameFocus,
                          ),
                          TextInput(
                            hintFragment: "Enter Username",
                            inputLabel: "Username",
                            icon: FlutterRemix.account_circle_line,
                            controller: userNameController,
                            focusNode: userNameFocus,
                            nextFocus: passwordFocus,
                          ),
                          TextInput(
                            hintFragment: "Enter Password",
                            inputLabel: "Password",
                            icon: FlutterRemix.key_2_line,
                            controller: passwordController,
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
          String website = websiteNickNameController.text;
          String username = userNameController.text;
          String password = passwordController.text;

          log('$website, $username, $password');

          Provider.of<PasswordData>(context, listen: false).addUserData(
            id: 4,
            websiteNickName: website.toString(),
            entryUsername: username.toString(),
            entryPassword: password.toString(),
            passwordStatus: 'Healthy',
          );

          log(Provider.of<PasswordData>(context, listen: false)
              .passwordEntries[3]
              .toString());

          if (_addExistingPasswordFormKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password Entry Added!")),
            );
          }

          Navigator.pop(context);
        },
        child: Icon(FlutterRemix.save_2_line),
      ),
    );
  }
}
