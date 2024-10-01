import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:global_med/utils/utils.dart';

class SocialSignInButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color color;
  final Color titleColor;
  final VoidCallback onPressed;

  const SocialSignInButton({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.color,
    required this.onPressed,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 35.0,
            width: 35.0,
          ),
          SizedBox(width: 20.h),
        ],
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: titleColor,
        ),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(titleColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5)),
      ),
    );
  }
}
