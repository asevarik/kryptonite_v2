// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:kryptonite/components/input_widget.dart';

class TextInput extends StatelessWidget {
  TextInput({
    Key? key,
    required this.inputLabel,
    required this.hintFragment,
    required this.icon,
    this.needGenerateIcon = false,
    this.hideText = false,
    this.focus = false,
    this.focusNode,
    this.nextFocus,
    this.controller,
  }) : super(key: key);

  final String hintFragment;
  final String inputLabel;
  final IconData icon;
  final bool focus;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextEditingController? controller;
  bool needGenerateIcon;
  bool hideText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.deepPurple.shade600),
        ),
        const SizedBox(
          height: 5,
        ),
        Material(
          child: InputWidget(
            icon: icon,
            needGenerateIcon: needGenerateIcon,
            hintFragment: hintFragment,
            hideText: hideText,
            focus: focus,
            focusNode: focusNode,
            nextFocus: nextFocus,
            controller: controller,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
