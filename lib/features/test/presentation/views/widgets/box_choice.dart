import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_styles.dart';

class BoxChoice extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  const BoxChoice(
    this.text, {
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0).w,
      child: InkWell(
        borderRadius: BorderRadius.circular(12).r,
        onTap: onTap,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16).w,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.deepPurple : Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12).r,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.purple,
                      blurRadius: 1.dg,
                      offset: Offset(0, 0),
                    ),
                  ]
                : [],
          ),
          duration: const Duration(milliseconds: 300),
          child: Text(
            text,
            style: !isSelected
                ? AppStyles.descriptionStyle
                : AppStyles.descriptionStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
