import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomIcon extends StatelessWidget {
  final String message;
  final String pathIcon;

  const CustomIcon({
    super.key,
    required this.message,
    required this.pathIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Fluttertoast.showToast(msg: message),
      child: Ink(
        height: 50,
        width: 50,
        child: Image.asset(
          pathIcon,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
