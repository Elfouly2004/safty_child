import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/helpers/spacer.dart';
import 'package:safty_children/core/themeing/app_styles.dart';

class HomeBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color bgColor;

  final VoidCallback? onTap;

  const HomeBox({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.bgColor,

    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
   

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8).w,
        padding: const EdgeInsets.all(16).w,
        height: 250.h,
        width: 250.w,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40.sp),
            verticalSpace(10),
            Text(
              title,

              style: AppStyles.boxStyle,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
