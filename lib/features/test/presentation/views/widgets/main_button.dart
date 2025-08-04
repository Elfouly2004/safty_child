import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_styles.dart';

class MainButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const MainButton({super.key, this.onPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.purple),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 27, vertical: 15).w,
        ),
      ),
      child: Text(
        title,
        style: AppStyles.descriptionStyle.copyWith(
          color: Colors.white,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
