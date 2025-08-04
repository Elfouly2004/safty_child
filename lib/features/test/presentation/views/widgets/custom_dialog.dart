
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/helpers/spacer.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/test/presentation/views/widgets/main_button.dart';

class CustomDialog extends StatelessWidget {
  final double correctAnswersCount;
  final double totalQuestions;

  const CustomDialog({
    super.key,
    required this.correctAnswersCount,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r),
      child: Container(
        width: 300.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20).r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.appBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20).r,
                  topRight: Radius.circular(20).r,
                ),
              ),
              child: Center(
                child: Text(
                  'انتهى اختبارك.',
                  style: AppStyles.appBarStyle.copyWith(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'نتيجتك: ${correctAnswersCount.toStringAsFixed(1)}',
              style: AppStyles.appBarStyle.copyWith(
                color: AppColors.purple,
                fontSize: 18.sp,
              ),
            ),
            verticalSpace(20),
            Text(
              'الدرجة الكلية: ${totalQuestions.toStringAsFixed(1)}',
              style: AppStyles.appBarStyle.copyWith(
                color: AppColors.appBarColor,
                fontSize: 18.sp,
              ),
            ),
            verticalSpace(50),
            MainButton(
              title: 'اغلاق',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // أو لو عايز ترجّع للصفحة الرئيسية تستخدم:
                // context.pushAndRemoveUntil(Routes.home, predicate: (_) => false);
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
