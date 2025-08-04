import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_styles.dart';

class NoAnswerDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const NoAnswerDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: AppColors.appBarColor),
        child: Center(
          child: Text(
            'تنبيه !',
            style: AppStyles.appBarStyle.copyWith(
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Text('يرجى اختيار إجابة على الأقل.', style: AppStyles.headStyle),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            'حسناً',
            style: AppStyles.headStyle.copyWith(color: AppColors.purple),
          ),
        ),
      ],
    );
  }
}
