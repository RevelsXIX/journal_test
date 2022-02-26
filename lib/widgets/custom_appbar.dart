import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  CustomAppBar(
  {Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {



  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(widget.text));
  }
}