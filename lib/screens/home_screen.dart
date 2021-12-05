// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:developer';

import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:kryptonite/components/collapse_app_bar.dart';
import 'package:kryptonite/components/header_bar.dart';
import 'package:kryptonite/components/pwn_box.dart';
import 'package:kryptonite/components/single_password_entry_item.dart';
import 'package:kryptonite/providers/provider.dart';
import 'package:kryptonite/screens/add_exisiting.dart';
import 'package:kryptonite/screens/generate_password.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: collapseAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          child: ListView(
            children: [
              HeaderBar(
                onButtonPress: () => log("Going to settings"),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PwnedBox(),
                    ListHeading(),
                    ListView.builder(
                      itemCount: Provider.of<PasswordData>(context)
                          .passwordEntries
                          .length,
                      addAutomaticKeepAlives: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SinglePasswordEntryItem(
                        passwordList: Provider.of<PasswordData>(context)
                            .passwordEntries[index],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: [
          FloatingActionButton(
            backgroundColor: Colors.pink,
            child: const Icon(FlutterRemix.add_line),
            heroTag: "add",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddExistingPasswordScreen(),
              ),
            ),
          ),
          FloatingActionButton(
            child: const Icon(FlutterRemix.magic_line),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GeneratePasswordScreen(
                  passwordList:
                      Provider.of<PasswordData>(context).passwordEntries,
                ),
              ),
            ),
            heroTag: "generate",
          ),
        ],
        animatedIconData: AnimatedIcons.menu_close,
        colorStartAnimation: Colors.black,
        colorEndAnimation: Colors.black,
      ),
    );
  }
}

class ListHeading extends StatelessWidget {
  const ListHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        "All saved passwords",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
