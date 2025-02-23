import 'package:flutter/material.dart';
import 'package:signup/Utils/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.height,
    required this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            height: height * 0.6,
            width: width * 0.6,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
