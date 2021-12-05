import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    required this.icon,
    required this.needGenerateIcon,
    required this.hintFragment,
    required this.hideText,
    this.focus = false,
    this.focusNode,
    this.nextFocus,
    this.controller,
    this.initialTextVal,
  }) : super(key: key);

  final IconData icon;
  final bool needGenerateIcon;
  final String hintFragment;
  final bool hideText;
  final bool focus;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final String? initialTextVal;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialTextVal,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: needGenerateIcon
            ? IconButton(
                icon: const Icon(FlutterRemix.magic_line),
                onPressed: () => log(
                  "Generating a new password...",
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintFragment,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.grey.shade700),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      obscureText: hideText ? true : false,
      autofocus: focus,
      focusNode: focusNode,
      controller: controller,
      onEditingComplete: () {
        if (nextFocus != null) {
          // retrieve data
          // Set State
          nextFocus!.requestFocus();
        } else {
          log("Exited out");
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
