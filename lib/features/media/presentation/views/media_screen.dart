import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/media/data/media_content.dart';
import 'package:safty_children/features/media/presentation/views/widgets/media_item.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title:  Text(AppStrings.main, style: AppStyles.appBarStyle.copyWith(fontSize: 20.sp)),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final item = mediaContent[index];
              return MediaItem(title: item.title, vidPath: item.vidPath);
            },
            itemCount: mediaContent.length,
          ),
        ),
      ),
    );
  }
}
