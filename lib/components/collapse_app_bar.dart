import 'package:flutter/material.dart';

PreferredSize collapseAppBar() {
  return PreferredSize(
    preferredSize: Size.zero,
    child: AppBar(
      elevation: 0,
    ),
  );
}
