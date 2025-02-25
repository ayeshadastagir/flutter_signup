import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signup/Utils/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  const SocialButton({
    Key? key,
    required this.iconPath,
    this.height = 50,
    this.width = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height.h,
        width: width.w,
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
